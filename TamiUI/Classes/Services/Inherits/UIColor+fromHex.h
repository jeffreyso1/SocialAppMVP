//
//  UIColor+fromHex.h
//  AppX
//
//  Created by GreenOwl Mobile on 2015-08-11.
//  Copyright (c) 2015 GreenOwl Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (fromHex)
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
@end
