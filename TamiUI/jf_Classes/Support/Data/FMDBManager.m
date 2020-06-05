//
//  FMDBManager.m
//  Tami
//
//  Created by Roman Mironenko on 2015-12-28.
//  Copyright © 2015 Roman Mironenko. All rights reserved.
//

#import "FMDBManager.h"

@implementation FMDBManager

+ (FMDBManager *)sharedInstance
{
    static FMDBManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)setFilePath:(NSString *)fileName{
    if (self.pathName == nil){
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docsPath = [paths objectAtIndex:0];
        NSString *dbPath = [docsPath stringByAppendingPathComponent:fileName];
        
        self.pathName = dbPath;
    }
}

- (void)initializeTable {
    if (!self.tableCreated){
        FMDatabase *database = [FMDatabase databaseWithPath:_pathName];
        [database open];
        //Current User
        [database executeUpdate:@"CREATE TABLE IF NOT EXISTS user(name TEXT NOT NULL, header_image_url TEXT NULL, profile_photo_url TEXT NULL, follower_count INTEGER NULL, blip_count INTEGER NULL, profile_tagline TEXT NULL, profile_bio TEXT NULL, website TEXT NULL, location TEXT NULL, gem_count INTEGER NULL)"];
        
        [database close];
        self.tableCreated = YES;
    }
}

- (void)resetTable {
    FMDatabase *database = [FMDatabase databaseWithPath:_pathName];
    [database open];
    [database executeUpdate:@"DELETE FROM user"];
    [database close];
}

@end
