//
//  ContactTableViewDataSourceProtocol.h
//  Contacts
//
//  Created by Do Thai Bao on 7/13/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ContactTableViewDataSourceProtocol <NSObject>

@required
- (NSDictionary <NSString *, NSArray<NSString *> *> *)data;

@end

NS_ASSUME_NONNULL_END
