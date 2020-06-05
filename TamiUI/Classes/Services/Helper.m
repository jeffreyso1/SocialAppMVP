//
//  Helper.m
//  TamiUI
//
//  Created by Admin on 2016-06-25.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Helper.h"
#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>
#import <CoreLocation/CLLocationManager.h>

@implementation Helper

+(Helper *)sharedInstance{
    static Helper * _sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[Helper alloc] init];
    });
    return _sharedInstance;
}
-(BOOL)requireLocationPermission {
    if ([[Helper sharedInstance] getLocationPermissionState]) {
    }
    return TRUE;
}

-(BOOL)getLocationPermissionState{
    BOOL locationServicesEnabled = YES;
    if([CLLocationManager locationServicesEnabled]){
        if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways){}
        else{
            locationServicesEnabled = NO;
        }
    }else{
        locationServicesEnabled = NO;
    }
    return locationServicesEnabled;
}

-(NSString *)getDocPathWithFileName:(NSString *)fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString * filePath = [NSString stringWithFormat:@"%@/%@",documentsDirectory, fileName];
    return filePath;
}

-(NSString *)getBundlePathWithFileName:(NSString *)fileName{
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
}

@end
