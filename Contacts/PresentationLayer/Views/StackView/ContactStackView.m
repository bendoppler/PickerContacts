//
//  ContactStackView.m
//  Contacts
//
//  Created by Do Thai Bao on 7/16/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactStackView.h"

@interface ContactStackView()

@property id<ContactStackViewProtocol> service;

@end

@implementation ContactStackView

- (instancetype)initWithService:(id<ContactStackViewProtocol>)service
{
    self = [super init];
    if (self) {
        _service = service;
        _tableView = [[ContactTableView alloc] init];
        _searchBar = [[ContactSearchBar alloc] init];
        _emptyView = [[ContactEmptyView alloc] init];
    }
    return self;
}

- (void)askPermission {
    if ([_service status] == CNAuthorizationStatusNotDetermined) {
        __weak ContactStackView *weakSelf = self;
            [[_service sharedInstance] requestAccessForEntityType:CNEntityTypeContacts
                                                      completionHandler:^(BOOL granted, NSError * _Nullable error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    ContactStackView *strongSelf = weakSelf;
                    if(strongSelf) {
                        if(error) {
                            [strongSelf->_tableView setHidden:YES];
                            [strongSelf->_emptyView setHidden:NO];
                            [strongSelf->_emptyView.label setText:@"Error when asking user's contacts' permission"];
                        }else if(!granted) {
                            [strongSelf->_tableView setHidden:NO];
                            [strongSelf->_emptyView setHidden:NO];
                            [strongSelf->_emptyView.label setText:@"This app needs permission to access contacts. Please enable it in settings."];
                        }else if(granted && !error) {
                            [strongSelf->_emptyView setHidden:YES];
                            [strongSelf->_tableView setHidden:NO];
                            ContactTableViewModel *viewModel = [[ContactTableViewModel alloc] initWithTableViewModel: [[ContactModelList alloc] initWithCNContacts:[strongSelf->_service contacts]]];
                            [strongSelf->_tableView setDataSource:[[ContactTableViewDataSource alloc] initWithViewModel: viewModel]];
                            [strongSelf->_tableView reloadData];
                        }
                    }
                });
            }];
    }else if ([_service status] == CNAuthorizationStatusDenied){
        [_tableView setHidden:NO];
        [_emptyView setHidden:NO];
        [_emptyView.label setText:@"This app needs permission to access contacts. Please enable it in settings."];
    }else if ([_service status] == CNAuthorizationStatusAuthorized) {
        [_emptyView setHidden:YES];
        [_tableView setHidden:NO];
        ContactTableViewModel *viewModel = [[ContactTableViewModel alloc] initWithTableViewModel: [[ContactModelList alloc] initWithCNContacts:[_service contacts]]];
        [_tableView setDataSource:[[ContactTableViewDataSource alloc] initWithViewModel: viewModel]];
        [_tableView reloadData];
    }
}

- (void)removeTableView {
    for(UIView *subview in self.subviews) {
        if([subview isMemberOfClass:[ContactTableView class]]) {
            [subview removeFromSuperview];
            break;
        }
    }
}

- (void)removeLabel {
    for(UIView *subview in self.subviews) {
        if([subview isMemberOfClass:[ContactEmptyView class]]) {
            [subview removeFromSuperview];
            break;
        }
    }
}

- (void)setConstraintWithHeight:(CGFloat)height andOriginY:(CGFloat)y {
    [self addArrangedSubview:_searchBar];
    [self addArrangedSubview:_tableView];
    [self addArrangedSubview:_emptyView];
    [self setFrame:CGRectMake(0, y, self.superview.bounds.size.width, height)];
    [self setAxis:UILayoutConstraintAxisVertical];
    [self setAlignment:UIStackViewAlignmentFill];
    [self setDistribution:UIStackViewDistributionFill];
    [self setSpacing:0];
    [_searchBar setConstraints];
    [_tableView setConstraints];
    [_emptyView setConstraints];
    [_tableView setHidden:NO];
    [_emptyView setHidden:YES];
    [self askPermission];
}


@end
