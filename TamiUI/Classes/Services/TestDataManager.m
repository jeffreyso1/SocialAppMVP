//
//  TestDataManager.m
//  TamiUI
//
//  Created by Admin on 2016-06-25.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "TestDataManager.h"
#import "BlipModel.h"

#import "BlipDetail.h"
#import "BlipPreview.h"
#import "BlipComment.h"
#import "BlipTag.h"

#import "UserProfile.h"

@implementation TestDataManager

+ (instancetype)sharedInstance {
    static TestDataManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (NSArray *)getArrayOfBlipModels {
    NSArray *models = [[NSArray alloc] init];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TestBlipModels" ofType:@"json"];
    if (filePath) {
        NSString *json = [NSString stringWithContentsOfFile:filePath encoding:(NSStringEncoding)nil error:nil];
        
        NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        models = [BlipModel arrayOfModelsFromData:data error:&error];
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }
    return models;
}

//In most cases, server calls will be asynchronus with a mix of background queue for data and main queue for ui update
- (void)getBlipPosts:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TestBlipPosts" ofType:@"json"];
        if (filePath) {
            NSData *data = [NSData dataWithContentsOfFile:filePath];
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, data, nil);
            });
        }
    });
}

- (void)getUserProfileSelf:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TestUserProfileSelf" ofType:@"json"];
        if (filePath) {
            NSData *data = [NSData dataWithContentsOfFile:filePath];
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, data, nil);
            });
        }
    });
}

- (void)getUserProfileSelfBlips:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TestUserProfileSelfBlips" ofType:@"json"];
        if (filePath) {
            NSData *data = [NSData dataWithContentsOfFile:filePath];
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, data, nil);
            });
        }
    });
}

- (void)getUserProfileOther:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TestUserProfileOther" ofType:@"json"];
        if (filePath) {
            NSData *data = [NSData dataWithContentsOfFile:filePath];
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, data, nil);
            });
        }
    });
}

- (void)getUserProfileOtherBlips:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TestUserProfileOtherBlips" ofType:@"json"];
        if (filePath) {
            NSData *data = [NSData dataWithContentsOfFile:filePath];
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, data, nil);
            });
        }
    });
}

- (void)getTestFollower:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TestFollower" ofType:@"json"];
        if (filePath) {
            NSData *data = [NSData dataWithContentsOfFile:filePath];
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, data, nil);
            });
        }
    });
}

- (void)getTestFollowing:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TestFollowing" ofType:@"json"];
        if (filePath) {
            NSData *data = [NSData dataWithContentsOfFile:filePath];
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, data, nil);
            });
        }
    });
}


- (void)getGemStoreInfo:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"GemStoreInfo" ofType:@"json"];
        if (filePath) {
            NSData *data = [NSData dataWithContentsOfFile:filePath];
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, data, nil);
            });
        }
    });
}



@end
