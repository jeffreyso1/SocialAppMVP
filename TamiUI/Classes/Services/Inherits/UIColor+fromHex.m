//
//  UIColor+fromHex.m
//  AppX
//
//  Created by GreenOwl Mobile on 2015-08-11.
//  Copyright (c) 2015 GreenOwl Mobile. All rights reserved.
//

#import "UIColor+fromHex.h"

@implementation UIColor (fromHex)

+(UIColor*)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
{
    unsigned int hexInt = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexInt];
    
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexInt & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexInt & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexInt & 0xFF))/255
                    alpha:alpha];
    return color;
}

@end
