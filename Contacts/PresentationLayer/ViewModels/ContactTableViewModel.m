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

- (instancetype)initWithTableViewModel:(id<ContactTableViewModelProtocol>)model {
    self = [super init];
    if(self) {
        _model = model;
        _data = [[NSMutableArray alloc] init];
        _keys = [[NSMutableArray alloc] init];
        if(_model) {
            NSArray<ContactModel *> *contacts = [_model contactList];
            NSMutableDictionary<NSString *,NSMutableArray<NSArray *> *> *res = [[NSMutableDictionary alloc] init];
            for(ContactModel *contact in contacts) {
                NSString *abbreviatedName = [self generateAbbreviatedNameWithFirstName:contact.firstName andLastName:contact.lastName];
                NSString* key = [self convertToKeyFromAbbreviatedName:abbreviatedName];
                if(res[key] == nil) {
                    res[key] = [[NSMutableArray alloc] init];
                }
                NSString *fullName = [self generateFullNameWithFirstName:contact.firstName middleName:contact.middleName lastName:contact.lastName nameSuffix:contact.nameSuffix adnPhoneNumber:contact.phoneNumberArray[0]];
                [res[key] addObject:@[abbreviatedName, fullName]];
            }
            NSArray *keys = [res allKeys];
            _keys = [keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                return [obj1 compare:obj2];
            }];
            for(NSString* key in _keys) {
                [_data addObject:res[key]];
            }
        }
    }
    return self;
}

- (NSArray<NSArray *> *)data {
    return _data;
}

- (NSString *)convertToKeyFromAbbreviatedName:(NSString *)abbreviatedName {
    if ([abbreviatedName length] == 2) {
        return [abbreviatedName substringWithRange:NSMakeRange(1, 1)];
    }
    return abbreviatedName;
}

- (NSString *)generateAbbreviatedNameWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName {
    if(firstName == nil && lastName == nil) {
        return @"#";
    }
    if(![self validText:firstName] && [self validText:lastName]) {
        return [NSString stringWithFormat:@"%c", [lastName characterAtIndex:0]];
    }
    if([self validText:firstName] && ![self validText:lastName]) {
        return [NSString stringWithFormat:@"%c", [firstName characterAtIndex:0]];
    }
    return [NSString stringWithFormat:@"%c%c", [firstName characterAtIndex:0], [lastName characterAtIndex:0]];
}

- (NSString *)generateFullNameWithFirstName:(NSString *)firstName middleName:(NSString *)middleName
                                   lastName:(NSString *)lastName nameSuffix:(NSString *)nameSuffix adnPhoneNumber:(NSString *)phoneNumber {
    if(firstName == nil && middleName == nil && lastName == nil && nameSuffix == nil) {
        return phoneNumber;
    }
    NSMutableString *res = [[NSMutableString alloc] init];
    if([self validText:firstName]) {
        [res appendFormat:@"%@ ", firstName];
    }
    if([self validText:middleName]) {
        [res appendFormat:@"%@ ", middleName];
    }
    if([self validText:lastName]) {
        [res appendFormat:@"%@ ", lastName];
    }
    if([self validText:nameSuffix]) {
        [res appendFormat:@"%@", nameSuffix];
    }
    if([res characterAtIndex: res.length-1] == ' ') {
        return [res substringWithRange:NSMakeRange(0, res.length-1)];
    }
    return res;
}

- (BOOL)validText:(NSString *)text {
    return text == nil || [text isEqualToString:@""] ? NO : YES;
}

- (UIColor *)colorWithAbbreviatedName:(NSString *)abbreviatedName andFullName:(NSString *)fullName {
    char firstChar, secondChar;
    if([abbreviatedName length] == 1) {
        firstChar = [abbreviatedName characterAtIndex:0];
    }else {
        firstChar = [abbreviatedName characterAtIndex:1];
    }
    if([fullName length] == 0) {
        secondChar = 'N';
    }else {
        secondChar = [fullName characterAtIndex:0];
    }
    float red = (firstChar*3 + secondChar*275) %256 /255.0;
    float green = (firstChar * secondChar) % 256 / 255.0;
    float blue = (firstChar % secondChar * 2019) % 256 / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:0.5];
}

- (NSArray<NSString *> *)indexTitles {
    return _keys;
}


@end
