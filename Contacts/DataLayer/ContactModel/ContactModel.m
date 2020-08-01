//
//  ContactModel.m
//  Contacts
//
//  Created by Do Thai Bao on 7/31/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactModel.h"

@implementation ContactModel

- (instancetype)initWithCNContact:(CNContact *)contact {
    self = [super init];
    if(self) {
        _identifier = contact.identifier;
        _firstName = contact.givenName;
        _middleName = contact.middleName;
        _lastName = contact.familyName;
        _nameSuffix = contact.nameSuffix;
        _phoneNumbers = [contact.phoneNumbers map: ^NSString* (CNLabeledValue *obj) {
            return [obj.value stringValue];
        }];
    }
    return self;
}

@end
