//
//  ContactSearchBarDelegate.m
//  Contacts
//
//  Created by Do Thai Bao on 7/23/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactSearchBarDelegate.h"

@implementation ContactSearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [_searchTextDelegate setDataWithSearchText:searchText];
}



- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar setText:@""];
    [_searchTextDelegate setDataWithSearchText:@""];
    [searchBar resignFirstResponder];
}

@end
