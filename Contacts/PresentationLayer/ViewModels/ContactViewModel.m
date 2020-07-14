//
//  ContactViewModel.m
//  Contacts
//
//  Created by Do Thai Bao on 7/14/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactViewModel.h"

@interface ContactViewModel()

@property ContactService *service;

@end

@implementation ContactViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _service = [ContactService new];
    }
    return self;
}

@end
