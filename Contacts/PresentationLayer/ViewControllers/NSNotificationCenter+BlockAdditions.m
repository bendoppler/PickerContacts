//
//  NSNotificationCenter+BlockAdditions.m
//  Contacts
//
//  Created by Do Thai Bao on 7/31/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "NSNotificationCenter+BlockAdditions.h"

@implementation NSNotificationCenter (BlockAdditions)



- (void)addObserverForName:(NSString * _Nonnull)name object:(id)object block:(void (^)(NSNotification *notification))block {
    [self addObserver:[block copy] selector:@selector(my_callBlockWithObject:) name:name object:object];
}

- (void)my_callBlockWithObject:(NSNotification *)notification{
    void (^block)(NSNotification *notification) = (id)self;
    block(notification);
};
@end
