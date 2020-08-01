//
//  ContactStackView.h
//  Contacts
//
//  Created by Do Thai Bao on 7/16/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactEmptyView.h"
#import "ContactSearchBar.h"
#import "ContactTableView.h"
#import "ContactTableViewModel.h"
#import "ContactService.h"
#import "ContactPickerCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactStackView : UIStackView

@property ContactTableView *tableView;
@property ContactSearchBar *searchBar;
@property ContactEmptyView *emptyView;
@property ContactPickerCollectionView *collectionView;

- (void)askPermission;
- (instancetype)initWithService:(ContactService *)service;
- (void)setConstraintWithHeight:(CGFloat)height andOriginY:(CGFloat)y;
- (void)updateContacts;
- (NSArray *)getPickedContactFullnames;

@end

NS_ASSUME_NONNULL_END
