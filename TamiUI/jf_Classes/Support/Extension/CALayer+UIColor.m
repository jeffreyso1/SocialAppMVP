//
//  CALayer+UIColor.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-14.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "CALayer+UIColor.h"

@implementation CALayer(UIColor)

- (void)setBorderUIColor:(UIColor*)color {
    self.borderColor = color.CGColor;
}

- (UIColor*)borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

@end