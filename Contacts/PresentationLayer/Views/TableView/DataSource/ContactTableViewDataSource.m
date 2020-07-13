//
//  ContactTableViewDataSource.m
//  Contacts
//
//  Created by Do Thai Bao on 7/10/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactTableViewDataSource.h"

@implementation ContactTableViewDataSource

- (instancetype)initWithViewModel:(id<ContactTableViewDataSourceProtocol>)viewModel {
    self = [super init];
    if(self) {
        _viewModel = viewModel;
    }
    return self;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [[_viewModel data] allKeys];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[_viewModel data] allKeys][section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[_viewModel data] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *indexes = [[_viewModel data] allKeys];
    return [[[_viewModel data] objectForKey:indexes[section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSArray *titles = [_viewModel.data objectForKey:_viewModel.data.allKeys[indexPath.section]];
    [cell.label setText:titles[indexPath.row]];
    UIGraphicsBeginImageContextWithOptions(cell.label.bounds.size, false, 0.0);
    [cell.label.layer renderInContext:UIGraphicsGetCurrentContext()];
    [cell.image setImage:UIGraphicsGetImageFromCurrentImageContext()];
    UIGraphicsEndImageContext();
    [cell setConstraints];
    return cell;
}

@end
