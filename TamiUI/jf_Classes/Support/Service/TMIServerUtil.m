//
//  TMIServerUtil.m
//  Tami
//
//  Created by Roman Mironenko on 2016-07-04.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import "TMIServerUtil.h"
#import "GlobalConstants.h"

@implementation TMIServerUtil

#pragma mark - Request
+ (void)sendHTTPRequest:(NSMutableDictionary *)arguments
                    url:(NSString *)url
            requestType:(NSString *)type
        completionBlock:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:type URLString:url parameters:arguments error:nil];
    request.timeoutInterval = 5;
    
    [TMIServerUtil startRequest:request completionBlock:completionHandler];
}


+ (void)startRequest:(NSMutableURLRequest *)request
     completionBlock:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            //NSLog(@"%@ %@", response, responseObject);
        }
        completionHandler(response, responseObject, error);
    }];
    [dataTask resume];
}

#pragma mark - Request Error
+ (BOOL)isError:(NSError *)error {
    if (error) {
        UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Request Timeout" message:@"A server error has occured. Please try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [errorAlert show];
        return true;
    } else {
        return false;
    }
}

#pragma mark - Get Test Json

+ (void)getTestBlipModels:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    [TMIServerUtil sendHTTPRequest:nil url:@"http://abportal.ca/TestBlipModels.json" requestType:@"GET" completionBlock:completionHandler];
}

+ (void)getTestBlipPageModels:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    [TMIServerUtil sendHTTPRequest:nil url:@"http://abportal.ca/TestBlipPageModels.json" requestType:@"GET" completionBlock:completionHandler];
}

#pragma mark - Reverse GeoCoding

+ (void)reverseGeoCoding:(double)lat
                     lng:(double)lng
         completionBlock:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler {
    NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?latlng=%.6f,%.6f",lat,lng];
    
    [TMIServerUtil sendHTTPRequest:nil url:url requestType:@"POST" completionBlock:completionHandler];
}

@end
