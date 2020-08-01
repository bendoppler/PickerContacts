//
//  ContactSearchBar.m
//  Contacts
//
//  Created by Do Thai Bao on 7/16/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactSearchBar.h"

@implementation ContactSearchBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setSearchBarStyle:UISearchBarStyleMinimal];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setPlaceholder:@"Search"];
        [self setShowsCancelButton:YES];
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        _contactSearchBarDelegate = [[ContactSearchBarDelegate alloc] init];
        [self setDelegate:_contactSearchBarDelegate];
    }
    return self;
}


- (void)setConstraintsWithCollectionViewIsHidden:(BOOL)isCollectionViewHidden {
    [NSLayoutConstraint deactivateConstraints:self.constraints];
    [self.widthAnchor constraintEqualToConstant:self.superview.bounds.size.width].active = YES;
    [self.centerXAnchor constraintEqualToAnchor:self.superview.centerXAnchor].active = YES;
    if(isCollectionViewHidden) {
        [self.topAnchor constraintEqualToAnchor:self.superview.topAnchor].active = YES;
        [self.heightAnchor constraintEqualToConstant:self.superview.bounds.size.height*0.1].active = YES;
    }else {
        [self.topAnchor constraintEqualToAnchor:self.superview.topAnchor constant:self.superview.bounds.size.height*0.12].active = YES;
        [self.heightAnchor constraintEqualToConstant:self.superview.bounds.size.height*0.1].active = YES;
    }
}

@end
