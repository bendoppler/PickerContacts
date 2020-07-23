//
//  ContactTableViewDataSourceProtocol.h
//  Contacts
//
//  Created by Do Thai Bao on 7/13/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ContactTableViewDataSourceProtocol <NSObject>

@optional
- (UIColor *)colorWithAbbreviatedName:(NSString *)abbreviatedName andFullName:(NSString *)fullName;
- (NSArray<NSString *> *)indexTitles;
- (NSArray<NSArray *> *)data;
- (NSArray<NSString *> *)indexSearchTextTitles;
- (NSArray<NSArray *> *)searchTextdata;
- (void)updateTableViewDataSourceWithSearchText:(NSString *)searchText;
@end

NS_ASSUME_NONNULL_END
