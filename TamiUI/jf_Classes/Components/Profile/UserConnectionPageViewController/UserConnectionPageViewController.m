//
//  UserConnectionPageViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-28.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "UserConnectionPageViewController.h"
#import "UserFollowerViewController.h"
#import "UserFollowingViewController.h"
#import "StoryboardList.h"
#import "TestDataManager.h"
#import "TMIServerUtil.h"
#import "UserFollower.h"

@interface UserConnectionPageViewController ()

@end

@implementation UserConnectionPageViewController

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

- (void)didFinishFetchingFollowers:(NSString *)tips {
    if (self.pageDelegate && [self.pageDelegate respondsToSelector:@selector(updateBarTitle:)]) {
        [self.pageDelegate updateBarTitle:tips];
    }
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
        UserFollowerViewController *itemController = [[StoryboardList profileStoryboard] instantiateViewControllerWithIdentifier:@"UserFollowerViewController"];
        itemController.pageDelegate = self;
        return itemController;
    } else if (itemIndex == 1) {
        UserFollowingViewController *itemController = [[StoryboardList profileStoryboard] instantiateViewControllerWithIdentifier:@"UserFollowingViewController"];
        itemController.pageDelegate = self;
        return itemController;
    }
    
    return nil;
}

@end
