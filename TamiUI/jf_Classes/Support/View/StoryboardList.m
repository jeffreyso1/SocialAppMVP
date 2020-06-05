//
//  StoryboardList.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-06.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "StoryboardList.h"
#import "GlobalConstants.h"

@implementation StoryboardList

+ (UIStoryboard *)mainStoryboard {
    static UIStoryboard *mainStoryboard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mainStoryboard = [UIStoryboard storyboardWithName:MAIN_STORYBOARD bundle:nil];
    });
    return mainStoryboard;
}

+ (UIStoryboard *)activityStoryboard {
    static UIStoryboard *activityStoryboard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        activityStoryboard = [UIStoryboard storyboardWithName:ACTIVITY_STORYBOARD bundle:nil];
    });
    return activityStoryboard;
}

+ (UIStoryboard *)blipStoryboard {
    static UIStoryboard *blipStoryboard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        blipStoryboard = [UIStoryboard storyboardWithName:BLIP_STORYBOARD bundle:nil];
    });
    return blipStoryboard;
}

+ (UIStoryboard *)profileStoryboard {
    static UIStoryboard *profileStoryboard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        profileStoryboard = [UIStoryboard storyboardWithName:PROFILE_STORYBOARD bundle:nil];
    });
    return profileStoryboard;
}

+ (UIStoryboard *)settingStoryboard {
    static UIStoryboard *settingStoryboard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        settingStoryboard = [UIStoryboard storyboardWithName:SETTING_STORYBOARD bundle:nil];
    });
    return settingStoryboard;
}

+ (UIStoryboard *)testPagesStoryboard {
    static UIStoryboard *testPagesStoryboard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        testPagesStoryboard = [UIStoryboard storyboardWithName:TESTPAGES_STORYBOARD bundle:nil];
    });
    return testPagesStoryboard;
}

@end
