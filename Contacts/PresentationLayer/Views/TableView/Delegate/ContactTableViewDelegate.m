//
//  ContactTableViewDelegate.m
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactTableViewDelegate.h"

const NSUInteger NUMBER_OF_INVITATION_LIMIT = 5;

@interface ContactTableViewDelegate()
@property NSMutableSet *pickedContacts;
@property NSString *state;
@property NSInteger count;
@end

@implementation ContactTableViewDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pickedContacts = [[NSMutableSet alloc] init];
        _state = [[NSString alloc] init];
        _count = 0;
    }
    return self;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactTableViewCell *cell = (ContactTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell.checkBox setChecked:YES];
    [_pickedContacts addObject:cell.viewModel.getIdentifier];
    [self updateState];
    [self pickCell:cell];
    return indexPath;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactTableViewCell *cell = (ContactTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell.checkBox setChecked:NO];
    [_pickedContacts removeObject:cell.viewModel.getIdentifier];
    [self updateState];
    [self unpickCell:cell];
    return indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return tableView.superview.bounds.size.height/8;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactTableViewCell *cell = (ContactTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    if(_pickedContacts.count < NUMBER_OF_INVITATION_LIMIT) {
        return YES;
    }
    if(![_pickedContacts containsObject:cell.viewModel.getIdentifier]) {
        _state = @"overload";
        [self.sendSMSDelegate updateSMSButtonWithState:_state];
    }
    return [_pickedContacts containsObject:cell.viewModel.getIdentifier];
}

- (void) unpickCell:(ContactTableViewCell *)cell {
    [self.pickContactsDelegate unpickContactWithIdentifier:[cell.viewModel getIdentifier]];
}

- (void)pickCell:(ContactTableViewCell *)cell{
    [self.pickContactsDelegate pickContactWithIdentifier:[cell.viewModel getIdentifier] image:cell.cellImageView.image andFullName:[cell.viewModel getFullName]];
}

- (void)updateState {
    NSString *newState;
    if(_pickedContacts.count == 0) {
        newState = @"empty";
    }else {
        newState = @"fit";
    }
    if(![_state isEqualToString:newState]) {
        _state = newState;
        [_sendSMSDelegate updateSMSButtonWithState:_state];
    }
    if(_count != _pickedContacts.count) {
        _count = _pickedContacts.count;
        [_pickedCountLabelDelegate updatePickedContactLabelWithCount:_count];
    }
}

- (NSSet *)getPickedContacts {
    return _pickedContacts;
}

@end
