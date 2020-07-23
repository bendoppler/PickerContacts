//
//  ContactSearchBarDelegateSearchTextDelegate.h
//  Contacts
//
//  Created by Do Thai Bao on 7/23/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ContactSearchBarDelegateSearchTextDelegate <NSObject>

- (void)setDataWithSearchText:(NSString *)searchText;

@end

NS_ASSUME_NONNULL_END
