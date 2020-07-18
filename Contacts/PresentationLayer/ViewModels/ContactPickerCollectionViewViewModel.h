//
//  ContactPickerCollectionViewViewModel.h
//  Contacts
//
//  Created by Do Thai Bao on 7/16/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactTableViewDelegatePickContactsDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactPickerCollectionViewViewModel : NSObject<ContactTableViewDelegatePickContactsDelegate>

- (NSArray *) data;

@end

NS_ASSUME_NONNULL_END
