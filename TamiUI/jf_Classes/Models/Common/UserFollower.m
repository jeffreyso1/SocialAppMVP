//
//  UserFollower.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-08-02.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "UserFollower.h"

@implementation UserFollower

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @[@"Name", @"name"],
             @"profilePhotoUrl" : @[@"ProfilePhotoURL", @"profile_photo_url"],
             @"profileTagline" : @[@"ProfileTagline", @"profile_tagline"],
             @"isFollowing" : @"IsFollowing"};
}

@end
