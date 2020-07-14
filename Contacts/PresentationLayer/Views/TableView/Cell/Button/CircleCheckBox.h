//
//  CircleCheckBox.h
//  Contacts
//
//  Created by Do Thai Bao on 7/13/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CircleCheckBox : UIControl

@property UIColor *checkColor;
@property UIColor *boxFillColor;
@property UIColor *boxBorderColor;
@property BOOL isChecked;

- (void)setChecked:(BOOL)isChecked;

@end

NS_ASSUME_NONNULL_END
