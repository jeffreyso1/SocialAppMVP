//
//  DataAccess.m
//  Tami
//
//  Created by Jeffrey So on 2016-05-19.
//  Copyright © 2016 Jeffrey So. All rights reserved.
//

#import "DatabaseDAO.h"
#import "FMDBManager.h"
#import "GlobalConstants.h"

@implementation DatabaseDAO

+ (UserProfile *)getCurrentUser {
    FMDatabase *db = [FMDatabase databaseWithPath:[FMDBManager sharedInstance].pathName];
    UserProfile *userInfo = nil;
    if ([db open]) {
        FMResultSet *rs = [db executeQuery:@"SELECT * FROM user"];
        if ([rs next]) {
            userInfo = [UserProfile yy_modelWithDictionary:[rs resultDictionary]];
        }
    }
    [db close];
    
    return userInfo;
}

+ (void)addCurrentUser:(UserProfile *)userInfo {
    FMDatabase *db = [FMDatabase databaseWithPath:[FMDBManager sharedInstance].pathName];
    if ([db open]) {
        [db executeUpdate:@"INSERT INTO user(name, header_image_url, profile_photo_url, follower_count, blip_count, profile_tagline, profile_bio, website, location, gem_count) VALUES(?,?,?,?,?,?,?,?,?,?)", userInfo.name, userInfo.headerImageUrl, userInfo.profilePhotoUrl, userInfo.followerCount, userInfo.blipCount, userInfo.profileTagline, userInfo.profileBio, userInfo.website, userInfo.location, userInfo.gemCount];
    }
    [db close];
}

+ (void)resetCurrentUser {
    FMDatabase *db = [FMDatabase databaseWithPath:[FMDBManager sharedInstance].pathName];
    if ([db open]) {
        [db executeUpdate:@"DELETE FROM user"];
    }
    [db close];
}

@end