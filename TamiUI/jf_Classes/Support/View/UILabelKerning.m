//
//  UILabelKerning.m
//  TamiUI
//
//  Created by Jeffrey So on 2016-07-13.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "UILabelKerning.h"

@implementation UILabelKerning

- (void)setKerning:(CGFloat)kerning
{
    _kerning = kerning;
    if(self.attributedText)
    {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
        [attributedString addAttribute:NSKernAttributeName value:@(kerning) range:NSMakeRange(0, self.attributedText.length)];
        self.attributedText = attributedString;
    }
}

@end
