//
//  BlipPagesViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-06.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "BlipPagesViewController.h"
#import "BlipDetailViewController.h"
#import "StoryboardList.h"

@interface BlipPagesViewController ()

@end

@implementation BlipPagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.dataSource = self;
    if ([self.blips count]) {
        NSArray *startingViewControllers = @[[self itemControllerForIndex:self.selectedIndex]];
        [self setViewControllers:startingViewControllers
                       direction:UIPageViewControllerNavigationDirectionForward
                        animated:NO
                      completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    BlipDetailViewController *itemController = (BlipDetailViewController *)viewController;
    
    if (itemController.itemIndex > 0) {
        return [self itemControllerForIndex:itemController.itemIndex-1];
    }
    
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    BlipDetailViewController *itemController = (BlipDetailViewController *)viewController;
    
    if (itemController.itemIndex+1 < [self.blips count]) {
        return [self itemControllerForIndex:itemController.itemIndex+1];
    }
    
    return nil;
}

- (BlipDetailViewController *)itemControllerForIndex:(NSInteger)itemIndex {
    if (itemIndex < [self.blips count]) {
        BlipDetailViewController *itemController = [[StoryboardList blipStoryboard] instantiateViewControllerWithIdentifier:@"BlipDetailViewController"];
        itemController.itemIndex = itemIndex;
        itemController.selectedBlip = [self.blips objectAtIndex:itemIndex];
        return itemController;
    }
    
    return nil;
}


@end
