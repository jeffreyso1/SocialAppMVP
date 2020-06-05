//
//  UILabelKerning.h
//  TamiUI
//
//  Created by Jeffrey So on 2016-07-13.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UILabelKerning : UILabel

@property (nonatomic) IBInspectable CGFloat kerning;
- (void)setKerning:(CGFloat)kerning;

@end