//
//  ConatctNavigationBarItemStackView.m
//  Contacts
//
//  Created by Do Thai Bao on 7/16/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactNavigationBarItemStackView.h"

@implementation ContactNavigationBarItemStackView

- (instancetype)initWithWidth:(CGFloat)width andHeight:(CGFloat)height {
    self = [super init];
    if(self) {
        _appName = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height/3)];
        _pickedCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, height/3+8, width, height*2/3 - 8)];
        [self setAxis:UILayoutConstraintAxisVertical];
        [self setDistribution:UIStackViewDistributionFill];
        [self setAlignment:UIStackViewAlignmentFill];
        [self addArrangedSubview:_appName];
        [self addArrangedSubview:_pickedCountLabel];
        [_appName setTextAlignment:NSTextAlignmentCenter];
        [_appName setText:@"Picker Contact"];
        [_appName setFont:[UIFont systemFontOfSize:14]];
        [_pickedCountLabel setTextAlignment:NSTextAlignmentCenter];
        [_pickedCountLabel setTextColor:[UIColor grayColor]];
        [_pickedCountLabel setFont:[UIFont systemFontOfSize:16]];
        [_pickedCountLabel setText:@"Picked: 0"];
    }
    return self;
}

@end
