//
//  ContactModel.h
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject

@property (nonatomic, readonly) NSString *identifier;
@property (nonatomic, readonly) NSString *firstName;
@property (nonatomic, readonly) NSString *lastName;
@property (nonatomic, readonly) NSString *middleName;
@property (nonatomic, readonly) NSString *nameSuffix;
@property (nonatomic, readonly) NSString *phoneNumber;

- (instancetype)initWithContactModel:(ContactModel *)contact;

@end

NS_ASSUME_NONNULL_END
