//
//  UserActivityPageViewController.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-29.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserActivityPageViewController : UIPageViewController <UIPageViewControllerDelegate>

- (void)transitionToPage:(NSInteger)itemIndex;
- (UIViewController *)itemControllerForIndex:(NSInteger)itemIndex;
@property NSInteger currentItemIndex;

@end
