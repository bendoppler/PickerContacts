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
        [_image setBackgroundColor:[UIColor blueColor]];
        _label = [UILabel new];
        [_label setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_checkBox];
        [self addSubview:_image];
        [self addSubview:_label];
    }
    return self;
}

- (void)setConstraints {
    [_checkBox setFrame:CGRectMake(10, self.bounds.size.height/3, self.bounds.size.height/2, self.bounds.size.height/2)];
    [_image setFrame:CGRectMake(self.bounds.size.height/2 + 20, 5, self.bounds.size.height*4/5, self.bounds.size.height*4/5)];
    CGFloat width = self.bounds.size.width - (self.bounds.size.height*1.3 + 30);
    [_label setFrame:CGRectMake(self.bounds.size.height*1.3 + 30, 0, width, self.bounds.size.height)];
}

@end
