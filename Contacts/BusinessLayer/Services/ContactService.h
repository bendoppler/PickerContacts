//
//  ContactService.h
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactStore.h"
#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactService : NSObject

//check current contact authorization status of the app
-(ContactAuthorizationStatus)authorizationStatus;

//request permission to access contacts
-(void)requestPermissionWithCallback:(void(^)(BOOL granted, NSError *error))callback;

//fetch contacts from data layer
-(void)fetchContactsWithCallback:(void(^)(NSArray<Contact *> *contacts, NSError *error))callback;

@end

NS_ASSUME_NONNULL_END
