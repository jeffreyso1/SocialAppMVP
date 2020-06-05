//
//  BlipListPagesViewController.m
//  TamiUI
//
//  Created by Jeffrey So on 2016-07-17.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "ProfileBlipPagesViewController.h"
#import "ProfileBlipListViewController.h"

#import "StoryboardList.h"

@interface ProfileBlipPagesViewController ()

@end

@implementation ProfileBlipPagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.dataSource = self;
    
    NSArray *startingViewControllers = @[[self itemControllerForIndex:0]];
    [self setViewControllers:startingViewControllers
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO
                  completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    UIViewController<ProfileBlipPage> *itemController = (UIViewController<ProfileBlipPage> *)viewController;
    
    if (itemController.itemIndex > 0) {
        return [self itemControllerForIndex:itemController.itemIndex-1];
    }
    
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    UIViewController<ProfileBlipPage> *itemController = (UIViewController<ProfileBlipPage> *)viewController;
    
    if (itemController.itemIndex+1 < 3) {
        return [self itemControllerForIndex:itemController.itemIndex+1];
    }
    
    return nil;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    UIViewController<ProfileBlipPage> *currentController = [pageViewController.viewControllers objectAtIndex:0];
    NSInteger currentIndex = currentController.itemIndex;
    if (self.pageDelegate && [self.pageDelegate respondsToSelector:@selector(pageWillTransitionToIndex:)]) {
        [self.pageDelegate pageWillTransitionToIndex:currentIndex];
    }
}

//give view controller by index, code structure assumes there will be different pages
- (UIViewController *)itemControllerForIndex:(NSInteger)itemIndex {
    if (itemIndex == 0) {
        ProfileBlipListViewController *itemController = [[StoryboardList profileStoryboard] instantiateViewControllerWithIdentifier:@"ProfileBlipListViewController"];
        itemController.itemIndex = itemIndex;
        itemController.selectedUser = self.selectedUser;
        return itemController;
    } else if (itemIndex == 1) {
        ProfileBlipListViewController *itemController = [[StoryboardList profileStoryboard] instantiateViewControllerWithIdentifier:@"ProfileBlipListViewController"];
        itemController.itemIndex = itemIndex;
        itemController.selectedUser = self.selectedUser;
        return itemController;
    } else if (itemIndex == 2) {
        ProfileBlipListViewController *itemController = [[StoryboardList profileStoryboard] instantiateViewControllerWithIdentifier:@"ProfileBlipListViewController"];
        itemController.itemIndex = itemIndex;
        itemController.selectedUser = self.selectedUser;
        return itemController;
    }
    
    return nil;
}


@end
