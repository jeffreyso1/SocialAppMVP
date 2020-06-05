//
//  UIImage-Ex.h
//  DIDO
//
//  Created by admin on 2015-04-24.
//  Copyright (c) 2015 GreenOwl Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImageEx)
-(UIImage *)imageResizeTo:(CGSize)newSize;
- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
-(UIImage *)maskImageColor:(UIColor *)color;
@end
