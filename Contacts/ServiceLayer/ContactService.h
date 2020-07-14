//
//  ContactService.h
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Contacts/Contacts.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContactService : NSObject

- (CNAuthorizationStatus)status;
- (CNContactStore *)sharedInstance;
- (NSArray<CNContact *> *)contacts;

@end

NS_ASSUME_NONNULL_END
