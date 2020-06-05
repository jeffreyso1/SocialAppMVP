//
//  GlobalConstants.h
//  StepOrTwo
//
//  Created by Jeffrey So on 2016-05-03.
//  Copyright © 2016 Jeffrey So. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalConstants : NSObject

extern NSString *APP_IDENTIFIER;

#pragma mark - SERVER URL
extern NSString *SERVER_URL;

#pragma mark - FILE AND KEY
extern NSString *SQL_FILENAME;
extern NSString *GMS_KEY;

#pragma mark - STORYBOARD
extern NSString *MAIN_STORYBOARD;
extern NSString *ACTIVITY_STORYBOARD;
extern NSString *BLIP_STORYBOARD;
extern NSString *PROFILE_STORYBOARD;
extern NSString *SETTING_STORYBOARD;
extern NSString *TESTPAGES_STORYBOARD;

//extern const int XXX_INT_CONST;
//extern const BOOL XXX_BOOL_CONST;

@end
