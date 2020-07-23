//
//  ContactPickerCollectionView.m
//  Contacts
//
//  Created by Do Thai Bao on 7/16/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactPickerCollectionView.h"


@implementation ContactPickerCollectionView


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if(self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self registerClass:[ContactPickerCollectionViewCell class] forCellWithReuseIdentifier:@"contactCell"];
        _ds = [[ContactPickerCollectionViewDataSource alloc] init];
        [self setShowsHorizontalScrollIndicator:NO];
        [self setDataSource:_ds];
    }
    return self;
}

- (void)setConstraints {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.topAnchor constraintEqualToAnchor:self.superview.topAnchor].active = YES;
    [self.heightAnchor constraintEqualToConstant:self.superview.bounds.size.height*0.12].active = YES;
}

@end
