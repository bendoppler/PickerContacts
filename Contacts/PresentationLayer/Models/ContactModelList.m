//
//  ContactModelList.m
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactModelList.h"

@interface ContactModelList()

@property NSMutableSet *ids;
@property NSMutableArray<ContactModel *> *models;
@property NSMutableDictionary<NSString *, ContactModel *> *modelsDict;

@end

@implementation ContactModelList


- (instancetype)init
{
    self = [super init];
    if (self) {
        _ids = [NSMutableSet new];
        _models = [NSMutableArray new];
        _modelsDict = [NSMutableDictionary new];
    }
    return self;
}

+ (instancetype)sharedInstance {
    static ContactModelList *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (NSArray<ContactModel *> *)contactList {
    return _models;
}

- (void)updateWithCNContacts:(NSArray<CNContact *> *)contacts {
    for(CNContact *contact in contacts) {
        if([_ids containsObject:contact.identifier] == NO) {
            [_ids addObject:contact.identifier];
            [_models addObject:[[ContactModel alloc] initWithCNContact:contact]];
        }
    }
}

@end
