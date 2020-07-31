//
//  ContactService.m
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactService.h"

@interface ContactService() {
    NSArray *keys;
}
@end

@implementation ContactService

- (CNContactStore *)sharedInstance {
    static CNContactStore *store;
    if(!store) {
        store = [[CNContactStore alloc] init];
    }
    return store;
}

- (CNAuthorizationStatus)status {
    return [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
}



- (NSArray *)keys {
    if(!keys) {
        keys = @[CNContactIdentifierKey,
                 CNContactFamilyNameKey,
                 CNContactMiddleNameKey,
                 CNContactGivenNameKey,
                 CNContactNameSuffixKey,
                 CNContactPhoneNumbersKey
        ];
    }
    return keys;
}

- (NSArray<CNContact *> *)contacts {
    NSPredicate *predicate = [CNContact predicateForContactsInContainerWithIdentifier:self.sharedInstance.defaultContainerIdentifier];
    NSError *error;
    NSArray<CNContact *> *res = [self.sharedInstance unifiedContactsMatchingPredicate:predicate keysToFetch:self.keys error:&error];
    if(error) {
        return nil;
    }
    return res;
}

@end
