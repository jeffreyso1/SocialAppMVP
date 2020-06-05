//
//  HomePagesViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-26.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "HomePagesViewController.h"
#import "BlipCreationViewController.h"
#import "StoryboardList.h"

@interface HomePagesViewController ()

@end

@implementation HomePagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    NSArray *startingViewControllers = @[[self itemControllerForIndex:0]];
    [self setViewControllers:startingViewControllers
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO
                  completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)transitionToPage:(NSInteger)itemIndex {
    if (self.currentItemIndex != itemIndex) {
        NSArray *startingViewControllers = @[[self itemControllerForIndex:itemIndex]];
        [self setViewControllers:startingViewControllers
                       direction:UIPageViewControllerNavigationDirectionForward
                        animated:NO
                      completion:nil];
    }
}

- (UIViewController *)itemControllerForIndex:(NSInteger)itemIndex {
    self.currentItemIndex = itemIndex;
    if (itemIndex == 0) {
        UIViewController *itemController = [[StoryboardList blipStoryboard] instantiateViewControllerWithIdentifier:@"BlipMapViewController"];
        return itemController;
    } else if (itemIndex == 1) {
        UIViewController *itemController = [[StoryboardList blipStoryboard] instantiateViewControllerWithIdentifier:@"BlipCreationViewController"];
        return itemController;
    } else if (itemIndex == 2) {
        UIViewController *itemController = [[StoryboardList blipStoryboard] instantiateViewControllerWithIdentifier:@"BlipSearchViewController"];
        return itemController;
    }
    
    return nil;
}

@end
