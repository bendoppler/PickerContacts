//
//  ContactTableViewDataSource.h
//  Contacts
//
//  Created by Do Thai Bao on 7/10/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MockContactTableViewModel.h"
#import "ContactTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactTableViewDataSource : NSObject<UITableViewDataSource>

@property id<ContactTableViewDataSourceProtocol> viewModel;
-(instancetype) initWithViewModel:(id<ContactTableViewDataSourceProtocol>)viewModel;

@end

NS_ASSUME_NONNULL_END
