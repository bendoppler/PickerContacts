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
@property NSMutableArray<UIImage *> *images;

@end

@implementation ContactPickerCollectionViewViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _imageList = [[NSMutableDictionary alloc] init];
        _images = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)pickContactWith:(NSString *)identifier andImage:(nonnull UIImage *)image{
    if(_imageList[identifier] == nil) {
        _imageList[identifier] = image;
        [_images addObject:image];
    }
    NSMutableDictionary *state = [[NSMutableDictionary alloc] init];
    if(_images.count > NUMBER_OF_ITEMS_LIMIT) {
        [self setValue:@"overload" forKey:@"state"];
        state[@"state"] = @"overload";
    }else {
        [self setValue:@"fit" forKey:@"state"];
        state[@"state"] = @"fit";
    }
    state[@"count"] = @(_images.count);
    [NSNotificationCenter.defaultCenter postNotificationName:@"com.piendop.contactPickerCollectionViewState" object:self userInfo:state];
}

- (void)unpickContactWith:(NSString *)identifier {
    if(_imageList[identifier] != nil) {
        UIImage *removedImage;
        for(UIImage *image in _images) {
            if(image == _imageList[identifier]) {
                removedImage = image;
                break;
            }
        }
        [_images removeObject:removedImage];
        [_imageList removeObjectForKey:identifier];
    }
    NSMutableDictionary *state = [[NSMutableDictionary alloc] init];
    if(_imageList.count == 0) {
        [self setValue:@"empty" forKey:@"state"];
        state [@"state"] = @"empty";
    }else if(_images.count > NUMBER_OF_ITEMS_LIMIT) {
        [self setValue:@"overload" forKey:@"state"];
        state[@"state"] = @"overload";
    }else {
        [self setValue:@"fit" forKey:@"state"];
        state[@"state"] = @"fit";
    }
    state[@"count"] = @(_imageList.count);
    [NSNotificationCenter.defaultCenter postNotificationName:@"com.piendop.contactPickerCollectionViewState" object:self userInfo:state];
}

- (NSArray *)data {
    return [_images subarrayWithRange:NSMakeRange(0, MIN(NUMBER_OF_ITEMS_LIMIT, _imageList.allValues.count))];
}

@end
