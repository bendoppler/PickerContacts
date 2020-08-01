//
//  ContactTableViewCellModel.m
//  Contacts
//
//  Created by Do Thai Bao on 7/18/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactTableViewCellViewModel.h"

@interface ContactTableViewCellViewModel()

@property NSString *fullName;
@property NSString *abbreviatedName;
@property Contact *model;

@end

@implementation ContactTableViewCellViewModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        _model = [[Contact alloc] init];
    }
    return self;
}

- (void)updateWithModel:(Contact *)model {
    _model = model;
}

- (NSString *)getAbbreviatedName {
    _abbreviatedName = @"";
    if(![self validText:_model.firstName] && ![self validText:_model.lastName]) {
        return _abbreviatedName = @"#";
    }
    if(![self validText:_model.firstName] && [self validText:_model.lastName]) {
        return _abbreviatedName = [NSString stringWithFormat:@"%c", [_model.lastName characterAtIndex:0]];
    }
    if([self validText:_model.firstName] && ![self validText:_model.lastName]) {
        return _abbreviatedName = [NSString stringWithFormat:@"%c", [_model.firstName characterAtIndex:0]];
    }
    return _abbreviatedName = [NSString stringWithFormat:@"%c%c", [_model.firstName characterAtIndex:0], [_model.lastName characterAtIndex:0]];
}


- (NSString *)getFullName {
    _fullName = @"";
    if(![self validText:_model.firstName] && ![self validText:_model.middleName] && ![self validText:_model.lastName] &&
       ![self validText:_model.nameSuffix]) {
        return _fullName = _model.phoneNumber ? _model.phoneNumber : nil;
    }
    NSMutableString *res = [[NSMutableString alloc] init];
    if([self validText:_model.firstName]) {
        [res appendFormat:@"%@ ", _model.firstName];
    }
    if([self validText:_model.middleName]) {
        [res appendFormat:@"%@ ", _model.middleName];
    }
    if([self validText:_model.lastName]) {
        [res appendFormat:@"%@ ", _model.lastName];
    }
    if([self validText:_model.nameSuffix]) {
        [res appendFormat:@"%@", _model.nameSuffix];
    }
    if([res characterAtIndex: res.length-1] == ' ') {
        return _fullName = [res substringWithRange:NSMakeRange(0, res.length-1)];
    }
    return _fullName = res;
}


- (BOOL)validText:(NSString *)text {
    return text == nil || [text isEqualToString:@""] ? NO : YES;
}

- (UIColor *)getColor {
    char firstChar, secondChar;
    if([self.abbreviatedName length] == 1) {
        firstChar = [self.abbreviatedName characterAtIndex:0];
    }else {
        firstChar = [self.abbreviatedName characterAtIndex:1];
    }
    if([self.fullName length] == 0) {
        secondChar = 'N';
    }else {
        secondChar = [self.fullName characterAtIndex:0];
    }
    float red = (firstChar*3 + secondChar*275) %256 /255.0;
    float green = (firstChar * secondChar) % 256 / 255.0;
    float blue = (firstChar % secondChar * 2019) % 256 / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:0.5];
}

- (NSString *)getIdentifier {
    if(_model) {
        return _model.identifier;
    }
    return nil;
}

@end
