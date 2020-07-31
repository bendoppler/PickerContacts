//
//  NSNotificationCenter+BlockAdditions.h
//  Contacts
//
//  Created by Do Thai Bao on 7/31/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (BlockAdditions)

- (void)addObserverForName: (NSString *)name object: (id _Nullable)object block: (void (^)(NSNotification *notification)) block;

@end

NS_ASSUME_NONNULL_END
