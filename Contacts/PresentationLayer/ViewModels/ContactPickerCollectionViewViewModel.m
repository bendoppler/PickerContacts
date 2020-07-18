//
//  ContactPickerCollectionViewViewModel.m
//  Contacts
//
//  Created by Do Thai Bao on 7/16/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactPickerCollectionViewViewModel.h"

NSUInteger NUMBER_OF_ITEMS_LIMIT = 5;

@interface ContactPickerCollectionViewViewModel()

@property NSMutableDictionary<NSString *, UIImage *> *imageList;

@end

@implementation ContactPickerCollectionViewViewModel


- (void)pickContactWith:(NSString *)identifier andImage:(nonnull UIImage *)image{
    if(_imageList[identifier] == nil) {
        _imageList[identifier] = image;
    }
    NSMutableDictionary *state = [[NSMutableDictionary alloc] init];
    if(_imageList.count > NUMBER_OF_ITEMS_LIMIT) {
        [self setValue:@"overload" forKey:@"state"];
        state[@"state"] = @"overload";
    }else {
        [self setValue:@"fit" forKey:@"state"];
        state[@"state"] = @"fit";
    }
    [NSNotificationCenter.defaultCenter postNotificationName:@"com.piendop.contactPickerCollectionViewState" object:self userInfo:state];
}

- (void)unpickContactWith:(NSString *)identifier {
    if(_imageList[identifier] != nil) {
        _imageList[identifier] = nil;
    }
    NSMutableDictionary *state = [[NSMutableDictionary alloc] init];
    if(_imageList.count == 0) {
        [self setValue:@"empty" forKey:@"state"];
        state [@"state"] = @"empty";
    }else {
        [self setValue:@"fit" forKey:@"state"];
        state [@"state"] = @"fit";
    }
    [NSNotificationCenter.defaultCenter postNotificationName:@"com.piendop.contactPickerCollectionViewState" object:self userInfo:state];
}

- (NSArray *)data {
    return [_imageList.allValues subarrayWithRange:NSMakeRange(0, NUMBER_OF_ITEMS_LIMIT)];
}

@end
