//
//  ContactModelList.h
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactModel.h"
#import "ContactTableViewModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactModelList : NSObject<ContactTableViewModelProtocol>

- (instancetype)initWithCNContacts:(NSArray<CNContact *> *)contacts;

@end

NS_ASSUME_NONNULL_END
