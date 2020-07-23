//
//  ContactTableViewDataSource.m
//  Contacts
//
//  Created by Do Thai Bao on 7/10/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactTableViewDataSource.h"

@interface ContactTableViewDataSource()
@property BOOL isInSearchMode;
@end

@implementation ContactTableViewDataSource

- (instancetype)initWithViewModel:(id<ContactTableViewDataSourceProtocol>)viewModel {
    self = [super init];
    if(self) {
        _viewModel = viewModel;
        _isInSearchMode = NO;
    }
    return self;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    if(_isInSearchMode) {
        return [_viewModel indexSearchTextTitles];
    }
    return [_viewModel indexTitles];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(_isInSearchMode) {
        return [_viewModel indexSearchTextTitles][section];
    }
    return [_viewModel indexTitles][section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if(_isInSearchMode) {
        return [[_viewModel indexSearchTextTitles] count];
    }
    return [[_viewModel indexTitles] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(_isInSearchMode) {
        return _viewModel.searchTextdata[section].count;
    }
    return [_viewModel data][section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    ContactModel *model = [ContactModel new];
    if(_isInSearchMode) {
        model = [_viewModel searchTextdata][indexPath.section][indexPath.row];
    }else {
        model = [_viewModel data][indexPath.section][indexPath.row];
    }
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

- (void)setDataWithSearchText:(NSString *)searchText {
    if([searchText isEqualToString:@""]) {
        _isInSearchMode = NO;
    }else {
        _isInSearchMode = YES;
        [_viewModel updateTableViewDataSourceWithSearchText:searchText];
    }
}

@end
