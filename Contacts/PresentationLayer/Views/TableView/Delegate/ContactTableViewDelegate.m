//
//  ContactTableViewDelegate.m
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactTableViewDelegate.h"

@implementation ContactTableViewDelegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactTableViewCell *cell = (ContactTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    if([cell isSelected]) {
        [self tableView:tableView willDeselectRowAtIndexPath:indexPath];
        [tableView deselectRowAtIndexPath:indexPath animated:false];
        if([self respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
            [self tableView:tableView didDeselectRowAtIndexPath:indexPath];
        }
        return nil;
    }
    [cell.checkBox setChecked:YES];
    return indexPath;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactTableViewCell *cell = (ContactTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell.checkBox setChecked:NO];
    return indexPath;
}


@end
