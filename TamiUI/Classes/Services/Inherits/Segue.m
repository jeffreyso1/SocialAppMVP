//
//  Segue.m
//  Dido
//
//  Created by admin on 2015-07-24.
//  Copyright (c) 2015 GreenOwl Mobile. All rights reserved.
//

#import "Segue.h"

@implementation Segue
-(void)perform{
    [[self sourceViewController] presentViewController:[self destinationViewController] animated:NO completion:nil];
}
@end
