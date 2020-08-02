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

@property NSMutableArray<NSString *> *identifiers;
@property NSMutableArray<UIImage *> *images;

@end

@implementation ContactPickerCollectionViewViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _identifiers = [[NSMutableArray alloc] init];
        _images = [[NSMutableArray alloc] init];
        _fullNames = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)pickContactWithIdentifier:(NSString *)identifier image:(UIImage *)image andFullName:(nonnull NSString *)fullName {
    if(_identifiers.count < NUMBER_OF_ITEMS_LIMIT) {
        [_identifiers addObject:identifier];
        [_fullNames addObject:fullName];
        [_images addObject:image];
        [self setValue:@"non-empty" forKey:@"state"];
    }
}
- (void)unpickContactWithIdentifier:(NSString *)identifier {
    NSUInteger index = [_identifiers indexOfObject:identifier];
    [_images removeObjectAtIndex:index];
    [_fullNames removeObjectAtIndex:index];
    [_identifiers removeObjectAtIndex:index];
    if(_identifiers.count == 0) {
        [self setValue:@"empty" forKey:@"state"];
    }else {
        [self setValue:@"non-empty" forKey:@"state"];
    }
}

- (NSArray *)data {
    return [_images subarrayWithRange:NSMakeRange(0, MIN(NUMBER_OF_ITEMS_LIMIT, _images.count))];
}

@end
