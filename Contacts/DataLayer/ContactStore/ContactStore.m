//
//  ContactStore.m
//  Contacts
//
//  Created by Do Thai Bao on 7/31/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactStore.h"

@interface ContactStore()

@property (nonatomic) NSMutableDictionary *callbackDictionary;
@property (nonatomic) NSMutableArray<dispatch_queue_t> *queueArray;
@property (nonatomic) BOOL busyFetching;
@property (nonatomic) dispatch_queue_t serialQueue;

@end

@implementation ContactStore

+ (instancetype)sharedInstance {
    static ContactStore *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _callbackDictionary = [[NSMutableDictionary alloc] init];
        _queueArray = [[NSMutableArray alloc] init];
        _serialQueue = dispatch_queue_create("Outer serial fetching queue", DISPATCH_QUEUE_SERIAL);
        _busyFetching = NO;
    }
    return self;
}

- (ContactAuthorizationStatus)authorizationStatus {
    switch ([CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts]) {
        case CNAuthorizationStatusNotDetermined:
            return ContactStatusNotDetermined;
        case CNAuthorizationStatusRestricted:
            return ContactStatusRestricted;
        case CNAuthorizationStatusDenied:
            return ContactStatusDenied;
        case CNAuthorizationStatusAuthorized:
            return ContactStatusAuthorized;
    }
}

-(void)requestPermissionWithCallback:(void (^)(BOOL, NSError * _Nonnull))callback {
    CNContactStore *store = [[CNContactStore alloc] init];
    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        callback(granted, error);
    }];
}

- (void)fetchContactsWithCallback:(void (^)(NSArray<ContactModel *> * _Nullable, NSError * _Nullable))callback onQueue:(dispatch_queue_t)currentQueue {
    if((callback) && (currentQueue)) {
        dispatch_async(_serialQueue, ^{
            const char *labelQueue = dispatch_queue_get_label(currentQueue);
            NSString *queueName = [NSString stringWithFormat:@"%s", labelQueue];
            if([self.queueArray containsObject:currentQueue]) {
                [self.callbackDictionary[queueName] addObject:callback];
            }else {
                [self.queueArray addObject:currentQueue];
                [self.callbackDictionary setObject:[[NSMutableArray alloc] init] forKey:queueName];
                [self.callbackDictionary[queueName] addObject:callback];
            }
            if(!self.busyFetching) {
                self.busyFetching = YES;
                dispatch_async(dispatch_queue_create("Concurrent fetching contacts queue", DISPATCH_QUEUE_CONCURRENT), ^{
                    if([CNContactStore class]) {
                        CNContactStore *store = [[CNContactStore alloc] init];
                        NSArray *keys = [self keys];
                        NSPredicate *predicate = [CNContact predicateForContactsInContainerWithIdentifier:store.defaultContainerIdentifier];
                        NSError *error;
                        NSArray *cnContacts = [store
                                               unifiedContactsMatchingPredicate:predicate
                                               keysToFetch:keys
                                               error:&error];
                        if(error) {
                            [self forwardWithContacts:nil error:error];
                        }else {
                            NSArray *contacts = [cnContacts map:^ContactModel* (CNContact *obj) {
                                if(obj.phoneNumbers.count > 0) {
                                    return [[ContactModel alloc] initWithCNContact:obj];
                                }
                                return nil;
                            }];
                            [self forwardWithContacts:contacts error:nil];
                        }
                    }
                });
            }
        });
    }
}

- (void)forwardWithContacts:(NSArray *)contacts error:(NSError *)error {
    for(dispatch_queue_t queue in _queueArray) {
        const char *labelQueue = dispatch_queue_get_label(queue);
        NSString *queueName = [NSString stringWithFormat:@"%s", labelQueue];
        NSArray *callbacks = _callbackDictionary[queueName];
        for (int i = 0; i < callbacks.count; ++i) {
            dispatch_async(queue, ^{
                id(^callback)(NSArray<ContactModel *> *, NSError *) = callbacks[i];
                callback(contacts, error);
            });
        }
        //reset state
        self.busyFetching = NO;
        [self.queueArray removeAllObjects];
        [self.callbackDictionary removeAllObjects];
    }
}

-(NSArray *)keys {
    return @[CNContactIdentifierKey,
             CNContactFamilyNameKey,
             CNContactMiddleNameKey,
             CNContactGivenNameKey,
             CNContactNameSuffixKey,
             CNContactPhoneNumbersKey];
}

@end
