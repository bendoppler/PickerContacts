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
    return [_viewModel indexTitles];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [_viewModel indexTitles][section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[_viewModel indexTitles] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_viewModel data][section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    ContactModel *model = [_viewModel data][indexPath.section][indexPath.row];
    if(![cell isSelected]) {
        [cell.checkBox setChecked:NO];
    }else {
        [cell.checkBox setChecked:YES];
    }
    [cell.viewModel updateWithModel:model];
    [cell.label setText:[cell.viewModel getFullName]];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    [label setText:[cell.viewModel getAbbreviatedName]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor whiteColor]];
    [label setBackgroundColor:[cell.viewModel getColor]];
    [label.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [label.layer setShadowOffset:CGSizeMake(0.0f, 0.0f)];
    [label.layer setShadowOpacity:0.5f];
    [label.layer setShadowRadius:1.0f];
    [label.layer setCornerRadius:label.frame.size.width/2];
    [label setClipsToBounds:YES];
    UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0.0);
    [label.layer renderInContext:UIGraphicsGetCurrentContext()];
    [cell.image setImage:UIGraphicsGetImageFromCurrentImageContext()];
    UIGraphicsEndImageContext();
    [cell.checkBox addTarget:tableView action:@selector(checkBoxTapped:) forControlEvents:UIControlEventTouchUpInside];
    [cell setConstraints];
    return cell;
}

- (void)checkBoxTapped:(id)sender{}

@end
