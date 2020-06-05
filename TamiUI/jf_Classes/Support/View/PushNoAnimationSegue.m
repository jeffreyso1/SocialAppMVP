//
//  PushNoAnimationSegue.m
//  StepOrTwo
//
//  Created by Roman Mironenko on 2015-09-02.
//  Copyright (c) 2015 Roman Mironenko. All rights reserved.
//

#import "PushNoAnimationSegue.h"

@implementation PushNoAnimationSegue

- (void)perform{
    [[[self sourceViewController] navigationController] pushViewController:[self   destinationViewController] animated:NO];
}

@end