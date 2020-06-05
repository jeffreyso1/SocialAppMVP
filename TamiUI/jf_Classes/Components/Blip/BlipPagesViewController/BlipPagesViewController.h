//
//  BlipPagesViewController.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-06.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlipPagesViewController : UIPageViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property NSArray *blips;
@property NSInteger selectedIndex;

@end
