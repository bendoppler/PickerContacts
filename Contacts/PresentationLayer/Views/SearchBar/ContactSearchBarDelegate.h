//
//  ContactSearchBarDelegate.h
//  Contacts
//
//  Created by Do Thai Bao on 7/23/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ContactSearchBarDelegateSearchTextDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactSearchBarDelegate : NSObject<UISearchBarDelegate>
@property (weak) id<ContactSearchBarDelegateSearchTextDelegate> searchTextDelegate;
@end

NS_ASSUME_NONNULL_END
