//
//  User.m
//  Tami
//
//  Created by Roman Mironenko on 2016-06-28.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import "UserProfile.h"

@implementation UserProfile

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @[@"Name", @"name"],
             @"headerImageUrl" : @[@"HeaderImageURL", @"header_image_url"],
             @"profilePhotoUrl" : @[@"ProfilePhotoURL", @"profile_photo_url"],
             @"followerCount" : @[@"FollowerCount", @"follower_count"],
             @"blipCount" : @[@"BlipCount", @"blip_count"],
             @"profileTagline" : @[@"ProfileTagline", @"profile_tagline"],
             @"profileBio" : @[@"ProfileBio", @"profile_bio"],
             @"website" : @[@"Website", @"website"],
             @"location" : @[@"Location", @"location"],
             @"gemCount" : @[@"GemCount", @"gem_count"]};
}

@end
