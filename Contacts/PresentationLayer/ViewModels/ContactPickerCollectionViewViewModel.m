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

@property NSMutableSet<NSString *> *identifiers;
@property NSMutableArray<UIImage *> *images;

@end

@implementation ContactPickerCollectionViewViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _identifiers = [[NSMutableSet alloc] init];
        _images = [[NSMutableArray alloc] init];
        _fullNames = [[NSMutableArray alloc] init];
    }
    return self;
}


- (BOOL)pickContactWithIdentifier:(NSString *)identifier image:(UIImage *)image andFullName:(nonnull NSString *)fullName {
    if(![_identifiers containsObject:identifier]) {
        [_identifiers addObject:identifier];
        [_images addObject:image];
        [_fullNames addObject:fullName];
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
    return [state[@"state"] isEqualToString:@"overload"];
}
- (void)unpickContactWithIdentifier:(NSString *)identifier image:(nonnull UIImage *)image andFullName:(nonnull NSString *)fullName{
    [_identifiers removeObject:identifier];
    [_images removeObject:image];
    [_fullNames removeObject:fullName];
    NSMutableDictionary *state = [[NSMutableDictionary alloc] init];
    if(_images.count == 0) {
        [self setValue:@"empty" forKey:@"state"];
        state [@"state"] = @"empty";
    }else if(_images.count > NUMBER_OF_ITEMS_LIMIT) {
        [self setValue:@"overload" forKey:@"state"];
        state[@"state"] = @"overload";
    }else {
        [self setValue:@"fit" forKey:@"state"];
        state[@"state"] = @"fit";
    }
    state[@"count"] = @(_images.count);
    [NSNotificationCenter.defaultCenter postNotificationName:@"com.piendop.contactPickerCollectionViewState" object:self userInfo:state];
}

- (NSArray *)data {
    return [_images subarrayWithRange:NSMakeRange(0, MIN(NUMBER_OF_ITEMS_LIMIT, _images.count))];
}

@end
