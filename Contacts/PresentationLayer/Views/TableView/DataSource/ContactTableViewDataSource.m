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
@property ContactImageCache *imageCache;
@end

@implementation ContactTableViewDataSource

- (instancetype)initWithViewModel:(id<ContactTableViewDataSourceProtocol>)viewModel {
    self = [super init];
    if(self) {
        _viewModel = viewModel;
        _isInSearchMode = NO;
        _imageCache = [[ContactImageCache alloc] init];
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
    if([_delegate.pickedContacts containsObject:cell.viewModel.getIdentifier]) {
        [cell.checkBox setChecked:YES];
        [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }else{
        [cell.checkBox setChecked:NO];
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
    [cell.viewModel updateWithModel:model];
    [cell.label setText:[cell.viewModel getFullName]];
    if(![cell.checkBox.allTargets containsObject:tableView]) {
        [cell.checkBox addTarget:tableView action:@selector(checkBoxTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    [cell setConstraints];
    UIImage *image = [_imageCache objectForKey:cell.viewModel.getIdentifier];
    if(image == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(cell.bounds.size.height/2 + 20, 5, cell.bounds.size.height - 10, cell.bounds.size.height - 10)];
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
        [cell.cellImageView setImage:UIGraphicsGetImageFromCurrentImageContext()];
        [_imageCache setObject:cell.cellImageView.image forKey:cell.viewModel.getIdentifier];
    }else {
        [cell.cellImageView setImage:image];
    }
    UIGraphicsEndImageContext();
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
