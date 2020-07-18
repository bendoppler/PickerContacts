//
//  ContactTableViewDataSource.h
//  Contacts
//
//  Created by Do Thai Bao on 7/10/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactTableViewCell.h"
#import "ContactTableViewDataSourceProtocol.h"
#import "ContactModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactTableViewDataSource : NSObject<UITableViewDataSource>

@property id<ContactTableViewDataSourceProtocol> viewModel;
-(instancetype) initWithViewModel:(id<ContactTableViewDataSourceProtocol>)viewModel;

@end

NS_ASSUME_NONNULL_END
