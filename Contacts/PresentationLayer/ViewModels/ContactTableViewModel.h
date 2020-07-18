//
//  ContactTableViewModel.h
//  Contacts
//
//  Created by Do Thai Bao on 7/10/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactTableViewDataSource.h"
#import "ContactTableViewModelProtocol.h"
#import "ContactModelList.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactTableViewModel : NSObject<ContactTableViewDataSourceProtocol>

- (void)updateTableViewWithModel:(id<ContactTableViewModelProtocol>)model;

@end

NS_ASSUME_NONNULL_END
