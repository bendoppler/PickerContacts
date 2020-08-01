//
//  ContactPickerCollectionViewFlowLayout.m
//  Contacts
//
//  Created by Do Thai Bao on 8/1/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactPickerCollectionViewFlowLayout.h"

@implementation ContactPickerCollectionViewFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(50, 50);
}

@end
