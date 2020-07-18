//
//  ContactEmptyLabel.m
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactEmptyView.h"

@interface ContactEmptyView()

@property NSLayoutConstraint *widthConstraint;
@property NSLayoutConstraint *heightConstraint;

@end

@implementation ContactEmptyView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        _label = [[UILabel alloc] init];
        [_label setNumberOfLines:0];
        [_label setLineBreakMode:NSLineBreakByWordWrapping];
        [_label setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_label];
    }
    return self;
}

- (void)setConstraints {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.heightAnchor constraintEqualToConstant:self.superview.bounds.size.height*0.9].active = YES;
    [_label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_label.widthAnchor constraintEqualToConstant:self.superview.bounds.size.width].active = YES;
    [_label.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = TRUE;
    [_label.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = TRUE;
}

@end
