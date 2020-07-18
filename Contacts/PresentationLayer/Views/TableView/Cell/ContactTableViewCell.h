//
//  ContactTableViewCell.h
//  Contacts
//
//  Created by Do Thai Bao on 7/11/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleCheckBox.h"
#import "ContactTableViewCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactTableViewCell : UITableViewCell

@property CircleCheckBox *checkBox;
@property ContactTableViewCellViewModel *viewModel;
@property UIImageView *image;
@property UILabel *label;
- (void)setConstraints;
@end

NS_ASSUME_NONNULL_END
