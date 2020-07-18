//
//  ContactSearchBar.m
//  Contacts
//
//  Created by Do Thai Bao on 7/16/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactSearchBar.h"

@interface ContactSearchBar()

@property NSLayoutConstraint *widthConstraint;
@property NSLayoutConstraint *heightConstraint;

@end

@implementation ContactSearchBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor blackColor]];
        [self setPlaceholder:@"Search"];
    }
    return self;
}

- (void)setConstraints {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.topAnchor constraintEqualToAnchor:self.superview.topAnchor].active = YES;
    [self.heightAnchor constraintEqualToConstant:self.superview.bounds.size.height*0.1].active = YES;
}

@end
