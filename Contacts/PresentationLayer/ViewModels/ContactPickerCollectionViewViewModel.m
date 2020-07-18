//
//  ContactPickerCollectionViewViewModel.m
//  Contacts
//
//  Created by Do Thai Bao on 7/16/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactPickerCollectionViewViewModel.h"

@interface ContactPickerCollectionViewViewModel()

@property NSMutableDictionary<NSString *, UIImage *> *imageList;

@end

@implementation ContactPickerCollectionViewViewModel


- (void)pickContactWith:(NSString *)identifier andImage:(nonnull UIImage *)image{
    if(_imageList[identifier] == nil) {
        _imageList[identifier] = image;
    }
}

- (void)unpickContactWith:(NSString *)identifier {
    if(_imageList[identifier] != nil) {
        _imageList[identifier] = nil;
    }
}

- (NSArray *)data {
    return [_imageList allValues];
}

@end
