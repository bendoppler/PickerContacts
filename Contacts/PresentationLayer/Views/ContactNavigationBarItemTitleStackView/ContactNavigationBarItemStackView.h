//
//  ConatctNavigationBarItemStackView.h
//  Contacts
//
//  Created by Do Thai Bao on 7/16/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactTableViewDelegatePickedCountLabelDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactNavigationBarItemStackView : UIStackView<ContactTableViewDelegatePickedCountLabelDelegate>

@property UILabel *appName;
@property UILabel *pickedCountLabel;

- (instancetype)initWithWidth:(CGFloat)width andHeight:(CGFloat)height;

@end

NS_ASSUME_NONNULL_END
