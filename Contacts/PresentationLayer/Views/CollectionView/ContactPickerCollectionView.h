//
//  ContactPickerCollectionView.h
//  Contacts
//
//  Created by Do Thai Bao on 7/16/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactPickerCollectionViewCell.h"
#import "ContactPickerCollectionViewDataSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactPickerCollectionView : UICollectionView

@property ContactPickerCollectionViewDataSource *collectionViewDataSource;
- (void)setConstraints;
@end

NS_ASSUME_NONNULL_END
