//
//  ContactTableViewModelProtocol.h
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ContactTableViewModelProtocol <NSObject>

- (NSArray<ContactModel *> *)contactList;
@end

NS_ASSUME_NONNULL_END
