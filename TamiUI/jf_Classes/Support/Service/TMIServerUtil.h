//
//  TMIServerUtil.h
//  Tami
//
//  Created by Roman Mironenko on 2016-07-04.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface TMIServerUtil : NSObject

#pragma mark - Request Error
+ (BOOL)isError:(NSError *)error;

#pragma mark - Get Test Json
+ (void)getTestBlipModels:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;
+ (void)getTestBlipPageModels:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;

@end
