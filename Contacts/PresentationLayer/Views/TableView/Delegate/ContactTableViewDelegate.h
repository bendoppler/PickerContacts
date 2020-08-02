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
#import "ContactTableViewDataSourcePickedContactsProtocol.h"
#import "ContactTableViewDelegateSendSMSDelegate.h"
#import "ContactTableViewDelegatePickedCountLabelDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactTableViewDelegate : NSObject<UITableViewDelegate, ContactTableViewDataSourcePickedContactsProtocol>

@property (nonatomic, weak) id<ContactTableViewDelegatePickContactsDelegate> pickContactsDelegate;
@property (nonatomic, weak) id<ContactTableViewDelegateSendSMSDelegate> sendSMSDelegate;
@property (nonatomic, weak) id<ContactTableViewDelegatePickedCountLabelDelegate> pickedCountLabelDelegate;

@end

NS_ASSUME_NONNULL_END
