//
//  ContactModel.m
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (instancetype)initWithContactModel:(ContactModel *)model {
    self = [super init];
    if(self) {
        _identifier = model.identifier;
        _firstName = model.firstName;
        _middleName = model.middleName;
        _lastName = model.lastName;
        _nameSuffix = model.nameSuffix;
        if(model.phoneNumbers > 0) {
            _phoneNumber = model.phoneNumbers[0];
        }
    }
    return self;
}


@end
