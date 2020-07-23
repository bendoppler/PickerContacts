//
//  ContactPickerCollectionViewDataSource.m
//  Contacts
//
//  Created by Do Thai Bao on 7/17/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactPickerCollectionViewDataSource.h"

@implementation ContactPickerCollectionViewDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        _viewModel = [[ContactPickerCollectionViewViewModel alloc] init];
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_viewModel.data count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ContactPickerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"contactCell" forIndexPath:indexPath];
    UIImage *image = _viewModel.data[indexPath.row];
    [cell.imageView setImage:image];
    return cell;
}



@end
