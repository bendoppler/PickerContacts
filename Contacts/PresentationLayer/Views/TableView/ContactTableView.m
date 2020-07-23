//
//  ContactTableView.m
//  Contacts
//
//  Created by Do Thai Bao on 7/10/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactTableView.h"

@interface ContactTableView()

@property NSLayoutConstraint *widthConstraint;
@property NSLayoutConstraint *heightConstraint;

@end

@implementation ContactTableView

- (instancetype)init {
    self = [super init];
    if(self) {
        [self registerClass:[ContactTableViewCell class] forCellReuseIdentifier:@"cell"];
        [self setSeparatorColor:[UIColor clearColor]];
        _tableViewDelegate = [[ContactTableViewDelegate alloc] init];
        [self setDelegate:_tableViewDelegate];
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return self;
}

- (void)setConstraintsWithCollectionViewIsHidden:(BOOL)isCollectionViewHidden {
    [NSLayoutConstraint deactivateConstraints:self.constraints];
    [self.widthAnchor constraintEqualToConstant:self.superview.bounds.size.width].active = YES;
    [self.centerXAnchor constraintEqualToAnchor:self.superview.centerXAnchor].active = YES;
    if (isCollectionViewHidden) {
        [self.heightAnchor constraintEqualToConstant:self.superview.bounds.size.height*0.9].active = YES;
    }else {
        [self.heightAnchor constraintEqualToConstant:self.superview.bounds.size.height*0.75].active = YES;
    }
}

- (void)deselectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated {
    [super deselectRowAtIndexPath:indexPath animated:animated];
}


- (void)setDataSource:(id<UITableViewDataSource>)dataSource {
    [super setDataSource:dataSource];
    _dataSourceDelegate = dataSource;
}

- (void)setDelegate:(id<UITableViewDelegate>)delegate {
    [super setDelegate:delegate];
}

- (void)checkBoxTapped:(id)sender{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self];
    NSIndexPath *indexPath = [self indexPathForRowAtPoint:buttonPosition];
    if(indexPath != nil) {
        if([sender isChecked] == NO) {
            [_tableViewDelegate tableView:self willSelectRowAtIndexPath:indexPath];
            [self selectRowAtIndexPath:indexPath animated:false scrollPosition:UITableViewScrollPositionMiddle];
            if([_tableViewDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
                [_tableViewDelegate tableView:self didSelectRowAtIndexPath:indexPath];
            }
        }
        else {
            [_tableViewDelegate tableView:self willDeselectRowAtIndexPath:indexPath];
            [self deselectRowAtIndexPath:indexPath animated:false];
            if([_tableViewDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
                [_tableViewDelegate tableView:self didDeselectRowAtIndexPath:indexPath];
            }
        }
    }
}

- (void)selectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition {
    [super selectRowAtIndexPath:indexPath animated:animated scrollPosition:scrollPosition];
}

@end
