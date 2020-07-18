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

- (void)pickContactWith:(NSString *)identifier andImage:(UIImage *)image;

- (void)unpickContactWith:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
