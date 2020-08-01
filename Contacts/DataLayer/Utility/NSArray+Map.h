//
//  NSArray+Map.h
//  Contacts
//
//  Created by Do Thai Bao on 7/31/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Map)
- (NSArray *)map:(id (^)(id obj))block;
@end

NS_ASSUME_NONNULL_END
