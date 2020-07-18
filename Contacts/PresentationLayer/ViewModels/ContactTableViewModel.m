//
//  ContactTableViewModel.m
//  Contacts
//
//  Created by Do Thai Bao on 7/10/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactTableViewModel.h"

@interface ContactTableViewModel()

@property id<ContactTableViewModelProtocol> model;
@property (nonatomic) NSMutableArray *data;
@property (nonatomic) NSArray *keys;
@end

@implementation ContactTableViewModel


- (NSArray<NSArray *> *)data {
    return _data;
}

- (BOOL)validText:(NSString *)text {
    return text == nil || [text isEqualToString:@""] ? NO : YES;
}

- (NSArray<NSString *> *)indexTitles {
    return _keys;
}

- (NSString *)keyFromFirstName:(NSString *)firstName andLastName:(NSString *)lastName {
    if([self validText:lastName]) {
        return [[lastName substringWithRange:NSMakeRange(0, 1)] capitalizedString];
    }
    if([self validText:firstName]) {
        return [[firstName substringWithRange:NSMakeRange(0, 1)] capitalizedString];
    }
    return @"#";
}

- (void)updateTableViewWithModel:(id<ContactTableViewModelProtocol>)model {
    if(!_model) {
        _model = model;
    }
    if(!_data) {
        _data = [[NSMutableArray alloc] init];
    }
    if(!_keys) {
        _keys = [[NSMutableArray alloc] init];
    }
    if(_model) {
        NSArray<ContactModel *> *contacts = [_model contactList];
        NSMutableDictionary<NSString *,NSMutableArray *> *res = [[NSMutableDictionary alloc] init];
        for(ContactModel *contact in contacts) {
            NSString* key = [self keyFromFirstName:contact.firstName andLastName:contact.lastName];
            if(res[key] == nil) {
                res[key] = [[NSMutableArray alloc] init];
            }
            [res[key] addObject:contact];
        }
        NSArray *keys = [res allKeys];
        _keys = [keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
        [_data removeAllObjects];
        for(NSString* key in _keys) {
            [_data addObject:res[key]];
        }
    }
}


@end
