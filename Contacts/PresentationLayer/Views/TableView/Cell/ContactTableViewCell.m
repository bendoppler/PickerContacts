//
//  ContactTableViewCell.m
//  Contacts
//
//  Created by Do Thai Bao on 7/11/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactTableViewCell.h"

@implementation ContactTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _checkBox = [CircleCheckBox new];
        _image = [UIImageView new];
        [_image setBackgroundColor:[UIColor clearColor]];
        _label = [UILabel new];
        [_label setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_checkBox];
        [self addSubview:_image];
        [self addSubview:_label];
        UIView *bgColorView = [[UIView alloc] init];
        bgColorView.backgroundColor = [UIColor colorWithRed:0.678 green:0.847 blue:0.902 alpha:0.5];
        [self setSelectedBackgroundView:bgColorView];
    }
    return self;
}

- (void)setConstraints {
    [_checkBox setFrame:CGRectMake(10, self.bounds.size.height/3, self.bounds.size.height/2, self.bounds.size.height/2)];
    [_image setFrame:CGRectMake(self.bounds.size.height/2 + 20, 5, self.bounds.size.height-5, self.bounds.size.height-5)];
    CGFloat width = self.bounds.size.width - (self.bounds.size.height*1.5 + 25);
    [_label setFrame:CGRectMake(self.bounds.size.height*1.5 + 25, 5, width, self.bounds.size.height-5)];
}


@end
