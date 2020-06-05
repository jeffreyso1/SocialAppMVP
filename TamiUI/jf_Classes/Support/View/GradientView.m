//
//  GradientView.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-06.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "GradientView.h"

@implementation GradientView

@dynamic layer;

+ (Class)layerClass {
    return [CAGradientLayer class];
}

@end
