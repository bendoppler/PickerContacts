//
//  ContactModelList.m
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "Contacts.h"

@interface Contacts()

@property NSMutableSet *ids;
@property NSMutableArray<Contact *> *models;
@property NSMutableDictionary<NSString *, Contact *> *modelsDict;

@end

@implementation Contacts


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
    static Contacts *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (NSArray<Contact *> *)contactList {
    return _models;
}

- (void)updateWithContactModels:(NSArray<ContactModel *> *)contacts {
    for(ContactModel *contact in contacts) {
        if([_ids containsObject:contact.identifier] == NO) {
            [_ids addObject:contact.identifier];
            [_models addObject:[[Contact alloc] initWithContactModel:contact]];
        }
    }
}

@end
