//
//  BlipListPagesViewController.h
//  TamiUI
//
//  Created by Jeffrey So on 2016-07-17.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlipPreview.h"
#import "UserProfile.h"

@protocol ProfileBlipPagesDelegate;

@interface ProfileBlipPagesViewController : UIPageViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (weak, nonatomic) id<ProfileBlipPagesDelegate> pageDelegate;
@property UserProfile *selectedUser;

- (UIViewController *)itemControllerForIndex:(NSInteger)itemIndex;

@end

@protocol ProfileBlipPage <NSObject>

@required
@property (nonatomic, readonly) NSInteger itemIndex;

@end

@protocol ProfileBlipPagesDelegate <NSObject>

@optional
- (void)pageWillTransitionToIndex:(NSInteger)newIndex;

@end
