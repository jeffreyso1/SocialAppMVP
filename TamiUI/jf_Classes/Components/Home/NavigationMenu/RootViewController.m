//
//  RootViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-21.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)awakeFromNib
{
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RootNavigationController"];
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftMenuViewController"];
}
@end
