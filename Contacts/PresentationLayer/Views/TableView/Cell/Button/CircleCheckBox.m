//
//  CircleCheckBox.m
//  Contacts
//
//  Created by Do Thai Bao on 7/13/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "CircleCheckBox.h"

@implementation CircleCheckBox

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initInternals];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initInternals];
    }
    return self;
}

- (void) initInternals {
    _boxFillColor = [UIColor colorWithRed:0 green:.478 blue:1 alpha:1];
    _boxBorderColor = [UIColor lightGrayColor];
    _checkColor = [UIColor whiteColor];
    _isChecked = NO;
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *boxPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2, 2, self.bounds.size.width-4, self.bounds.size.height-4)];
    if(_isChecked) {
        [_boxFillColor setFill];
        [[UIColor clearColor] setStroke];
        [boxPath fill];
        [boxPath stroke];
        UIBezierPath *checkPath = [UIBezierPath bezierPath];
        [checkPath moveToPoint:CGPointMake(self.bounds.size.width/5, self.bounds.size.height/2)];
        [checkPath addLineToPoint:CGPointMake(self.bounds.size.width/2.5, self.bounds.size.height * 5/7)];
        [checkPath addLineToPoint:CGPointMake(self.bounds.size.width * 4/5, self.bounds.size.height/3)];
        [_checkColor setStroke];
        [checkPath stroke];
    }else {
        [[UIColor whiteColor] setFill];
        [_boxBorderColor setStroke];
        [boxPath fill];
        [boxPath stroke];
    }
    [self setNeedsDisplay];
}

- (void)setChecked:(BOOL)isChecked {
    _isChecked = isChecked;
    [self setNeedsDisplay];
}

@end
