//
//  ContactStackViewProtocol.h
//  Contacts
//
//  Created by Do Thai Bao on 7/16/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Contacts/Contacts.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ContactStackViewProtocol <NSObject>

- (CNContactStore *)sharedInstance;
- (NSArray<CNContact *> *)contacts;
- (CNAuthorizationStatus)status;

@end

NS_ASSUME_NONNULL_END
