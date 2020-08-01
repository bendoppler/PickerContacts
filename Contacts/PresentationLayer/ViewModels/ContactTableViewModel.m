//
//  ContactTableViewModel.m
//  Contacts
//
//  Created by Do Thai Bao on 7/10/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactTableViewModel.h"

@interface ContactTableViewModel()

@property (nonatomic) NSMutableArray *data;
@property (nonatomic) NSArray *keys;
@property (nonatomic) NSMutableArray *searchTextData;
@property (nonatomic) NSMutableArray *searchTextKeys;

@end

@implementation ContactTableViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _data = [[NSMutableArray alloc] init];
        _keys = [[NSMutableArray alloc] init];
        _searchTextData = [[NSMutableArray alloc] init];
        _searchTextKeys = [[NSMutableArray alloc] init];
    }
    return self;
}

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

- (void)updateTableViewDataSourceWithContacts:(NSArray<Contact *> *)contacts {
    NSMutableDictionary<NSString *,NSMutableArray *> *res = [[NSMutableDictionary alloc] init];
    for(Contact *contact in contacts) {
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

- (void)updateTableViewDataSourceWithSearchText:(NSString *)searchText {
    [_searchTextKeys removeAllObjects];
    [_searchTextData removeAllObjects];
    for(int i = 0; i < _data.count; ++i) {
        NSArray *temp = _data[i];
        NSArray *matchedContacts = [temp objectsAtIndexes:[temp indexesOfObjectsPassingTest:^BOOL(Contact* obj, NSUInteger idx, BOOL *stop) {
            return [self isMatchedBetweenContact:obj andSearchText:searchText];
        }]];
        if(matchedContacts.count > 0) {
            [_searchTextKeys addObject:_keys[i]];
            [_searchTextData addObject:matchedContacts];
        }
    }
}

- (BOOL)isMatchedBetweenContact:(Contact *)contact andSearchText:(NSString *)searchText {
    NSString *fullName = [self getFullNameFromContact:contact];
    if([fullName.lowercaseString hasPrefix:searchText.lowercaseString]) {
        return YES;
    }
    return NO;
}

- (NSString *)getFullNameFromContact:(Contact *)contact{
    if(![self validText:contact.firstName] && ![self validText:contact.middleName] && ![self validText:contact.lastName] &&
       ![self validText:contact.nameSuffix]) {
        return contact.phoneNumber ? contact.phoneNumber : nil;
    }
    NSMutableString *fullName = [NSMutableString stringWithString:@""];
    if([self validText:contact.firstName]) {
        [fullName appendFormat:@"%@ ", contact.firstName];
    }
    if([self validText:contact.middleName]) {
        [fullName appendFormat:@"%@ ", contact.middleName];
    }
    if([self validText:contact.lastName]) {
        [fullName appendFormat:@"%@ ", contact.lastName];
    }
    if([self validText:contact.nameSuffix]) {
        [fullName appendFormat:@"%@", contact.nameSuffix];
    }
    if([fullName characterAtIndex: fullName.length-1] == ' ') {
        return [fullName substringWithRange:NSMakeRange(0, fullName.length-1)];
    }
    return fullName;
}

- (NSArray<NSString *> *)indexSearchTextTitles {
    return _searchTextKeys;
}

- (NSArray<NSArray *> *)searchTextdata {
    return _searchTextData;
}


@end
