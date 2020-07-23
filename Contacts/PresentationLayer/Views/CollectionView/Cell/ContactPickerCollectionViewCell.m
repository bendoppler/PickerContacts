//
//  ContactPickerCollectionViewCell.m
//  Contacts
//
//  Created by Do Thai Bao on 7/17/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactPickerCollectionViewCell.h"

@implementation ContactPickerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        [_imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
        [_imageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
    }
    return self;
}

@end
