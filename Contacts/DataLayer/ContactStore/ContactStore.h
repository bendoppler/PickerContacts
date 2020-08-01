//
//  ContactStore.h
//  Contacts
//
//  Created by Do Thai Bao on 7/31/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactStore : NSObject

typedef NS_ENUM(NSUInteger, ContactAuthorizationStatus) {
    ContactStatusNotDetermined = -1,
    ContactStatusDenied = 0,
    ContactStatusAuthorized = 1,
    ContactStatusRestricted = 2
};

//singleton contact store
+(instancetype)sharedInstance;

//check current contact authorization status of the app
- (ContactAuthorizationStatus)authorizationStatus;

//request permission to access contacts
-(void)requestPermissionWithCallback:(void(^)(BOOL granted, NSError *error))callback;

//fetch contacts from CNContacts
-(void)fetchContactsWithCallback:(void(^)(NSArray<ContactModel*> *contactArray, NSError *error))callback
                        onQueue:(dispatch_queue_t)currentQueue;
@end

NS_ASSUME_NONNULL_END
