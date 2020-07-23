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
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return self;
}

- (void)setConstraints {
}

- (void)setConstraintsWithCollectionViewIsHidden:(BOOL)isCollectionViewHidden {
    [NSLayoutConstraint deactivateConstraints:self.constraints];
    [self.widthAnchor constraintEqualToConstant:self.superview.bounds.size.width].active = YES;
    [self.centerXAnchor constraintEqualToAnchor:self.superview.centerXAnchor].active = YES;
    if(isCollectionViewHidden) {
        [self.topAnchor constraintEqualToAnchor:self.superview.topAnchor].active = YES;
        [self.heightAnchor constraintEqualToConstant:self.superview.bounds.size.height*0.1].active = YES;
    }else {
        [self.heightAnchor constraintEqualToConstant:self.superview.bounds.size.height*0.1].active = YES;
    }
}

@end
