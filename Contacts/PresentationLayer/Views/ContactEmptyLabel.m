//
//  ContactEmptyLabel.m
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactEmptyLabel.h"

@implementation ContactEmptyLabel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setNumberOfLines:0];
        [self setLineBreakMode:NSLineBreakByWordWrapping];
        [self setTextAlignment:NSTextAlignmentCenter];
    }
    return self;
}

- (void)setConstraints {
    [self setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [self.widthAnchor constraintEqualToAnchor:self.superview.widthAnchor].active = YES;
    [self.centerXAnchor constraintEqualToAnchor:self.superview.centerXAnchor].active = YES;
    [self.centerYAnchor constraintEqualToAnchor:self.superview.centerYAnchor].active = YES;
}

@end
