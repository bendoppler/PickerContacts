//
//  ContactTableViewDelegatePickContactsDelegate.h
//  Contacts
//
//  Created by Do Thai Bao on 7/17/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ContactTableViewDelegatePickContactsDelegate <NSObject>

- (BOOL)pickContactWithIdentifier:(NSString *)identifier image:(UIImage *)image andFullName:(NSString *)fullName;

- (void)unpickContactWithIdentifier:(NSString *)identifier image:(UIImage *)image andFullName:(NSString *)fullName;

@end

NS_ASSUME_NONNULL_END
