//
//  ContactTableView.h
//  Contacts
//
//  Created by Do Thai Bao on 7/10/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactTableViewDataSource.h"
#import "ContactTableViewModel.h"
#import "ContactTableViewDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactTableView : UITableView

- (instancetype)init;
- (void)setConstraints;

@end

NS_ASSUME_NONNULL_END
