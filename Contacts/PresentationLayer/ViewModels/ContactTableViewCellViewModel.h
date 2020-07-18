//
//  ContactTableViewCellModel.h
//  Contacts
//
//  Created by Do Thai Bao on 7/18/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactModel.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContactTableViewCellViewModel : NSObject


- (void)updateWithModel:(ContactModel *)model;
- (NSString *)getFullName;
- (NSString *)getAbbreviatedName;
- (UIColor *)getColor;
- (NSString *)getIdentifier;

@end

NS_ASSUME_NONNULL_END
