//
//  ContactService.m
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactService.h"

@interface ContactService()

@property (nonatomic) dispatch_queue_t serialBusinessContactPickerQueue;

@end

@implementation ContactService

- (ContactAuthorizationStatus)authorizationStatus {
    return [ContactStore.sharedInstance authorizationStatus];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _serialBusinessContactPickerQueue = dispatch_queue_create("Serial business contact picker queue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)requestPermissionWithCallback:(void (^)(BOOL, NSError * _Nullable))callback {
    [ContactStore.sharedInstance requestPermissionWithCallback:^(BOOL granted, NSError * _Nullable error) {
        callback(granted, error);
    }];
}

- (void)fetchContactsWithCallback:(void (^)(NSArray<Contact *> * _Nullable, NSError * _Nullable))callback {
    dispatch_async(_serialBusinessContactPickerQueue, ^ {
        [ContactStore.sharedInstance
         fetchContactsWithCallback:^(NSArray<ContactModel *> *contacts, NSError *error) {
            if(error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    callback(nil, error);
                });
            }else {
                NSArray *businessContacts = [contacts map:^Contact*(ContactModel *obj) {
                    return [[Contact alloc]initWithContactModel:obj];
                }];
                dispatch_async(dispatch_get_main_queue(), ^{
                    callback(businessContacts, nil);
                });
            }
        }
         onQueue:self->_serialBusinessContactPickerQueue];
    });
}

@end
