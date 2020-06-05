//
//  UserActivityPageViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-29.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "UserActivityPageViewController.h"
#import "StoryboardList.h"

@interface UserActivityPageViewController ()

@end

@implementation UserActivityPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    [self transitionToPage:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)transitionToPage:(NSInteger)itemIndex {
    if (self.currentItemIndex != itemIndex) {
        self.currentItemIndex = itemIndex;
        NSArray *startingViewControllers = @[[self itemControllerForIndex:itemIndex]];
        [self setViewControllers:startingViewControllers
                       direction:UIPageViewControllerNavigationDirectionForward
                        animated:NO
                      completion:nil];
    }
}

- (UIViewController *)itemControllerForIndex:(NSInteger)itemIndex {
    if (itemIndex == 0) {
        UIViewController *itemController = [[StoryboardList activityStoryboard] instantiateViewControllerWithIdentifier:@"UserActivityNotificationController"];
        return itemController;
    } else if (itemIndex == 1) {
        UIViewController *itemController = [[StoryboardList activityStoryboard] instantiateViewControllerWithIdentifier:@"ActivityNotificationViewController"];
        return itemController;
    } else if (itemIndex == 2) {
        UIViewController *itemController = [[StoryboardList activityStoryboard] instantiateViewControllerWithIdentifier:@"ActivityNotificationViewController"];
        return itemController;
    } else if (itemIndex == 3) {
        UIViewController *itemController = [[StoryboardList activityStoryboard] instantiateViewControllerWithIdentifier:@"FollowingNotificationViewController"];
        return itemController;
    }
    
    return nil;
}

@end
