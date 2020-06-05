//
//  TestDataManager.h
//  TamiUI
//
//  Created by Admin on 2016-06-25.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlipPageModel.h"

@interface TestDataManager : NSObject

+ (instancetype)sharedInstance;
- (NSArray *)getArrayOfBlipModels;

- (void)getBlipPosts:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;
- (void)getUserProfileSelf:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;
- (void)getUserProfileSelfBlips:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;
- (void)getUserProfileOther:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;
- (void)getUserProfileOtherBlips:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;
- (void)getTestFollower:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;
- (void)getTestFollowing:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;
- (void)getGemStoreInfo:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;

@end
