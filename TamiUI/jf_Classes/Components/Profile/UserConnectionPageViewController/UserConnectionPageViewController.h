//
//  UserConnectionPageViewController.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-28.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserFollowerViewController.h"

@protocol UserConnectionPageDelegate;

@interface UserConnectionPageViewController : UIPageViewController <UIPageViewControllerDelegate, UserConnectionPagesDelegate>

- (UIViewController *)itemControllerForIndex:(NSInteger)itemIndex;
- (void)transitionToPage:(NSInteger)itemIndex;
@property (weak, nonatomic) id<UserConnectionPageDelegate> pageDelegate;
@property NSInteger currentItemIndex;

@end

@protocol UserConnectionPageDelegate <NSObject>

@optional
- (void)updateBarTitle:(NSString *)title;

@end


