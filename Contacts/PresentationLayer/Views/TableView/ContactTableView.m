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
        [self setAllowsMultipleSelection:YES];
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
        [self.heightAnchor constraintEqualToConstant:self.superview.bounds.size.height*0.78].active = YES;
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

- (void)checkBoxTapped:(CircleCheckBox *)sender{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self];
    NSIndexPath *indexPath = [self indexPathForRowAtPoint:buttonPosition];
    [sender setSelected:![sender isSelected]];
    if(indexPath != nil) {
        NSIndexPath *checkIndexPath;
        if([sender isChecked] == YES) {
            checkIndexPath = [self.tableViewDelegate tableView:self willDeselectRowAtIndexPath:indexPath];
            if(checkIndexPath) {
                [self deselectRowAtIndexPath:indexPath animated:NO];
            }
        }
        else {
            checkIndexPath = [self.tableViewDelegate tableView:self willSelectRowAtIndexPath:indexPath];
            if(checkIndexPath) {
                [self selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionMiddle];
            }
        }
    }
}

- (void)selectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition {
    [super selectRowAtIndexPath:indexPath animated:animated scrollPosition:scrollPosition];
}

@end
