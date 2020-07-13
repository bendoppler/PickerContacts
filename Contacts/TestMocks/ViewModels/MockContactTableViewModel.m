//
//  MockContactTableViewModel.m
//  Contacts
//
//  Created by Do Thai Bao on 7/11/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "MockContactTableViewModel.h"

@implementation MockContactTableViewModel

- (NSDictionary<NSString *,NSArray<NSString *> *> *)data {
    return @{@"A": @[@"John Applessed"], @"B": @[@"Kate Bell"], @"H": @[@"Daniel Higgins Jr.", @"Anna Haro"]};
}

@end
