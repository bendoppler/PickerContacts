//
//  ContactTableView.m
//  Contacts
//
//  Created by Do Thai Bao on 7/10/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactTableView.h"

@implementation ContactTableView

- (instancetype)init {
    self = [super init];
    if(self) {
        [self registerClass:[ContactTableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return self;
}

- (void)setConstraints {
    [super updateConstraints];
    [self setTranslatesAutoresizingMaskIntoConstraints: NO];
    [[self topAnchor] constraintEqualToAnchor: [[self superview] topAnchor]].active = YES;
    [[self leftAnchor] constraintEqualToAnchor:[[self superview] leftAnchor]].active = YES;
    [[self rightAnchor] constraintEqualToAnchor:[[self superview] rightAnchor]].active = YES;
    [[self bottomAnchor] constraintEqualToAnchor:[[self superview] bottomAnchor]].active = YES;
}

- (void)setDataSource:(id<UITableViewDataSource>)dataSource {
    [super setDataSource:dataSource];
    _dataSourceDelegate = dataSource;
}

@end
