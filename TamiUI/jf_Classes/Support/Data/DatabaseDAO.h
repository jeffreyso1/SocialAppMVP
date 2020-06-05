//
//  DataAccess.h
//  Tami
//
//  Created by Jeffrey So on 2016-05-19.
//  Copyright © 2016 Jeffrey So. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserProfile.h"

@interface DatabaseDAO : NSObject

+ (UserProfile *)getCurrentUser;
+ (void)addCurrentUser:(UserProfile *)userInfo;
+ (void)resetCurrentUser;

@end
