//
//  ContactPickerCollectionViewCell.m
//  Contacts
//
//  Created by Do Thai Bao on 7/17/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactPickerCollectionViewCell.h"

@implementation ContactPickerCollectionViewCell

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if(self) {
        _imageView = [[UIImageView alloc] init];
    }
    return self;
}

@end
