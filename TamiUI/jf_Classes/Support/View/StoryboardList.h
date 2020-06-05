//
//  StoryboardList.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-06.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StoryboardList : NSObject

+ (UIStoryboard *)mainStoryboard;
+ (UIStoryboard *)activityStoryboard;
+ (UIStoryboard *)blipStoryboard;
+ (UIStoryboard *)profileStoryboard;
+ (UIStoryboard *)settingStoryboard;
+ (UIStoryboard *)testPagesStoryboard;

@end
