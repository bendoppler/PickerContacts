//
//  NSArray+Map.m
//  Contacts
//
//  Created by Do Thai Bao on 7/31/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "NSArray+Map.h"

@implementation NSArray (Map)

- (NSArray *)map:(id (^)(id obj))block {
    NSMutableArray *new = [NSMutableArray array];
    for(id obj in self) {
        id newObj = block(obj);
        if (newObj) {
            [new addObject:newObj];
        }
    }
    return new;
}

@end
