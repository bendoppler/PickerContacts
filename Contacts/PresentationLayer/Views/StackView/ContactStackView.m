//
//  ContactStackView.m
//  Contacts
//
//  Created by Do Thai Bao on 7/16/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactStackView.h"

@interface ContactStackView()

@property ContactService *service;
@property ContactTableViewModel *viewModel;
@property CGFloat height;
@property CGFloat y;
@end

@implementation ContactStackView

- (instancetype)initWithService:(ContactService *)service
{
    self = [super init];
    if (self) {
        _service = service;
        _tableView = [[ContactTableView alloc] init];
        _searchBar = [[ContactSearchBar alloc] init];
        _emptyView = [[ContactEmptyView alloc] init];
        _viewModel = [[ContactTableViewModel alloc] init];
        [_searchBar.contactSearchBarDelegate setSearchTextDelegate:_tableView];
    }
    return self;
}

- (void)askPermission {
    __weak ContactStackView *weakSelf = self;
    switch (_service.authorizationStatus) {
        case ContactStatusNotDetermined:{
            [_service requestPermissionWithCallback:^(BOOL granted, NSError * _Nonnull error) {
                ContactStackView *strongSelf = weakSelf;
                if(error) {
                    [strongSelf->_tableView setHidden:YES];
                    [strongSelf->_emptyView setHidden:NO];
                    [strongSelf->_emptyView.label setText:@"Error when asking user's contacts' permission"];
                }else if(!granted) {
                    [strongSelf->_tableView setHidden:YES];
                    [strongSelf->_emptyView setHidden:NO];
                    [strongSelf->_emptyView.label setText:@"This app needs permission to access contacts. Please enable it in settings."];
                }else if(granted && !error) {
                    [strongSelf->_emptyView setHidden:YES];
                    [strongSelf->_tableView setHidden:NO];
                    [strongSelf updateContacts];
                }
            }];
            break;
        }
        case ContactStatusDenied:{
            [_tableView setHidden:YES];
            [_emptyView setHidden:NO];
            [_emptyView.label setText:@"This app needs permission to access contacts. Please enable it in settings."];
            break;
        }
        case ContactStatusRestricted:{
            [_tableView setHidden:YES];
            [_emptyView setHidden:NO];
            [_emptyView.label setText:@"This app needs permission to access contacts. Please enable it in settings."];
            break;
        }
        case ContactStatusAuthorized:{
            [_emptyView setHidden:YES];
            [_tableView setHidden:NO];
            [self updateContacts];
            break;
        }
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
    [self setFrame:CGRectMake(0, y, self.superview.bounds.size.width, height)];
    [self setAxis:UILayoutConstraintAxisVertical];
    [self setAlignment:UIStackViewAlignmentFill];
    [self setDistribution:UIStackViewDistributionFill];
    [self setSpacing:0];
    _height = height;
    _y = y;
    if(!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setSectionInset:UIEdgeInsetsMake(0, 10, 0, 10)];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        [flowLayout setMinimumLineSpacing:20];
        _collectionView = [[ContactPickerCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, height/6) collectionViewLayout:flowLayout];
        [_tableView.tableViewDelegate setDelegate:_collectionView.ds.viewModel];
        [_collectionView.ds.viewModel addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    }
    [self addArrangedSubview:_collectionView];
    [self addArrangedSubview:_searchBar];
    [self addArrangedSubview:_tableView];
    [self addArrangedSubview:_emptyView];
    [_collectionView setConstraints];
    [_searchBar setConstraintsWithCollectionViewIsHidden:YES];
    [_tableView setConstraintsWithCollectionViewIsHidden:YES];
    [_emptyView setConstraints];
    [_collectionView setHidden:YES];
    [_tableView setHidden:NO];
    [_emptyView setHidden:YES];
    [self askPermission];
}

- (void)updateContacts {
    __weak ContactStackView *weakSelf = self;
    [_service fetchContactsWithCallback:^(NSArray<Contact *> * _Nonnull contacts, NSError * _Nonnull error) {
        ContactStackView *strongSelf = weakSelf;
        if(error) {
            [strongSelf->_tableView setHidden:YES];
            [strongSelf->_emptyView setHidden:NO];
            [strongSelf->_emptyView.label setText:@"Error when asking user's contacts' permission"];
        }else {
            [strongSelf->_viewModel updateTableViewDataSourceWithContacts:contacts];
            [strongSelf->_tableView setDataSource:[[ContactTableViewDataSource alloc] initWithViewModel:strongSelf->_viewModel]];
            [strongSelf->_tableView reloadData];
        }
    }];
}

//MARK: Observer
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"state"]) {
        NSString *state = change[NSKeyValueChangeNewKey];
        if ([state isEqualToString:@"empty"]) {
            [NSLayoutConstraint deactivateConstraints:self.constraints];
            [self setFrame:CGRectMake(0, _y, self.superview.bounds.size.width, _height)];
            [self setAxis:UILayoutConstraintAxisVertical];
            [self setAlignment:UIStackViewAlignmentFill];
            [self setDistribution:UIStackViewDistributionFill];
            [self setSpacing:0];
            [_collectionView setHidden:YES];
            [_tableView setConstraintsWithCollectionViewIsHidden:YES];
        }else {
            if ([_collectionView isHidden] == YES) {
                [NSLayoutConstraint deactivateConstraints:self.constraints];
                [self setFrame:CGRectMake(0, _y, self.superview.bounds.size.width, _height)];
                [self setAxis:UILayoutConstraintAxisVertical];
                [self setAlignment:UIStackViewAlignmentFill];
                [self setDistribution:UIStackViewDistributionFill];
                [self setSpacing:0];
                [_collectionView setHidden:NO];
                [_searchBar setConstraintsWithCollectionViewIsHidden:NO];
                [_tableView setConstraintsWithCollectionViewIsHidden:NO];
            }
            [_collectionView reloadData];
        }
    }
}

- (NSArray *)getPickedContactFullnames {
    return [_collectionView.ds getPickedContactFullnames];
}

- (void)dealloc
{
    [_collectionView.ds.viewModel removeObserver:self forKeyPath:@"state"];
}


@end
