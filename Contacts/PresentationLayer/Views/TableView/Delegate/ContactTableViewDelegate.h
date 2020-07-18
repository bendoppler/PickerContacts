//
//  ContactTableViewDelegate.h
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactTableViewCell.h"
#import <UIKit/UIKit.h>
#import "ContactPickerCollectionViewDataSource.h"
#import "ContactTableViewDelegatePickContactsDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactTableViewDelegate : NSObject<UITableViewDelegate>

@property (nonatomic, weak) id<ContactTableViewDelegatePickContactsDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
