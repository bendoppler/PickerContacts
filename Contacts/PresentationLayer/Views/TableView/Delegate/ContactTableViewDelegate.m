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
        if([self respondsToSelector:@selector(tableView:didDeselectRowAtIndexPath:)]) {
            [self tableView:tableView didDeselectRowAtIndexPath:indexPath];
        }
        [self unpickCellWithIndentifier:[cell.viewModel getIdentifier]];
        return nil;
    }
    [self pickCellWithIndentifier:[cell.viewModel getIdentifier] andImage:cell.image.image];
    [cell.checkBox setChecked:YES];
    return indexPath;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactTableViewCell *cell = (ContactTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell.checkBox setChecked:NO];
    return indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return tableView.bounds.size.height/8;
}

- (void) unpickCellWithIndentifier:(NSString *)identifier {
    [self.delegate unpickContactWith:identifier];
}

- (void) pickCellWithIndentifier:(NSString *)identifier andImage:(UIImage *)image{
    [self.delegate pickContactWith:identifier andImage:image];
}

@end
