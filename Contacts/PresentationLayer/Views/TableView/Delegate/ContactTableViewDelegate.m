//
//  ContactTableViewDelegate.m
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactTableViewDelegate.h"

@interface ContactTableViewDelegate()
@property NSMutableSet *pickedContacts;
@end

@implementation ContactTableViewDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pickedContacts = [[NSMutableSet alloc] init];
    }
    return self;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactTableViewCell *cell = (ContactTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    BOOL isOverloaded = [self pickCell:cell];
    if(!isOverloaded) {
        [cell.checkBox setChecked:YES];
        [_pickedContacts addObject:cell.viewModel.getIdentifier];
        return indexPath;
    }
    [cell.checkBox setChecked:NO];
    return nil;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactTableViewCell *cell = (ContactTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell.checkBox setChecked:NO];
    [_pickedContacts removeObject:cell.viewModel.getIdentifier];
    [self unpickCell:cell];
    return indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return tableView.superview.bounds.size.height/8;
}

- (void) unpickCell:(ContactTableViewCell *)cell {
    [self.delegate unpickContactWithIdentifier:[cell.viewModel getIdentifier]];
}

- (BOOL) pickCell:(ContactTableViewCell *)cell{
    return [self.delegate pickContactWithIdentifier:[cell.viewModel getIdentifier] image:cell.cellImageView.image andFullName:[cell.viewModel getFullName]];
}

- (NSSet *)getPickedContacts {
    return _pickedContacts;
}

@end
