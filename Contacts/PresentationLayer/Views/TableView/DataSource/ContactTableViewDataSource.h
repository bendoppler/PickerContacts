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
#import "Contact.h"
#import "ContactImageCache.h"
#import "ContactTableViewDataSourcePickedContactsProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactTableViewDataSource : NSObject<UITableViewDataSource>

@property id<ContactTableViewDataSourceProtocol> viewModel;
@property id<ContactTableViewDataSourcePickedContactsProtocol> delegate;
-(instancetype) initWithViewModel:(id<ContactTableViewDataSourceProtocol>)viewModel;
- (void)setDataWithSearchText:(NSString *)searchText;
@end

NS_ASSUME_NONNULL_END
