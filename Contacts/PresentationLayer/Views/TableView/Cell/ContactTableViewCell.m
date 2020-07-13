//
//  ContactTableViewCell.m
//  Contacts
//
//  Created by Do Thai Bao on 7/11/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactTableViewCell.h"

@interface ContactTableViewCell()

@property UIStackView *stackView;

@end

@implementation ContactTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _stackView = [UIStackView new];
        [_stackView setAxis:UILayoutConstraintAxisHorizontal];
        [_stackView setDistribution:UIStackViewDistributionEqualSpacing];
        _checkBox = [CircleCheckBox new];
        _image = [UIImageView new];
        _label = [UILabel new];
        [_stackView addSubview:_checkBox];
        [_stackView addSubview:_image];
        [_stackView addSubview:_label];
    }
    return self;
}

- (void)setConstraints {
    [_checkBox setFrame:CGRectMake(20, self.bounds.size.height/3, 30, 30)];
    [_image setFrame:CGRectMake(60, 20, self.bounds.size.width/4, self.bounds.size.height * 2/3)];
    [_label setFrame:CGRectMake(100, 0, self.bounds.size.width/2, self.bounds.size.height)];
}

@end
