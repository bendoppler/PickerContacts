//
//  ContactPickerCollectionViewDataSource.h
//  Contacts
//
//  Created by Do Thai Bao on 7/17/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ContactPickerCollectionViewViewModel.h"
#import "ContactPickerCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactPickerCollectionViewDataSource : NSObject<UICollectionViewDataSource>

@property ContactPickerCollectionViewViewModel *viewModel;

- (NSArray*)getPickedContactFullnames;

@end

NS_ASSUME_NONNULL_END
