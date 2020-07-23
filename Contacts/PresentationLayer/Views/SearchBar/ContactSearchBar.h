//
//  ContactSearchBar.h
//  Contacts
//
//  Created by Do Thai Bao on 7/16/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContactSearchBar : UISearchBar

- (void)setConstraintsWithCollectionViewIsHidden:(BOOL)isCollectionViewHidden;

@end

NS_ASSUME_NONNULL_END
