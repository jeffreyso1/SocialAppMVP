//
//  LocationService.m
//  TamiUI
//
//  Created by Admin on 2016-06-25.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "LocationService.h"
#import "Helper.h"

@implementation LocationService
@synthesize locationManager;

+(LocationService *)sharedInstance{
    static LocationService * _sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[LocationService alloc] init];
    });
    return _sharedInstance;
}

- (instancetype) init  {
    if (self = [super init]) {
        self.locationManager=[[CLLocationManager alloc]init];
        locationManager.pausesLocationUpdatesAutomatically = NO;
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;

    }
    return self;
}
- (void)requestLocationPermission {
    
    if (![[Helper sharedInstance]getLocationPermissionState]) {
        if([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
            [locationManager requestAlwaysAuthorization];
        }
    }
    [locationManager requestAlwaysAuthorization];
    
    
}
- (void)startService {
    if ([[Helper sharedInstance]getLocationPermissionState]) {
//        [self startUpdatingLocation];
        if([CLLocationManager locationServicesEnabled]){
            [locationManager startUpdatingLocation];
        }

    }
}

- (void)stopService {
    if ([[Helper sharedInstance]getLocationPermissionState]) {
        if([CLLocationManager locationServicesEnabled]){
            [locationManager stopUpdatingLocation];
        }

    }
}

- (CLLocation*)currentLocation {
    return locationManager.location;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    if(self.delegate != nil){
        [self.delegate LocationUpdate:locationManager didUpdateToLocation:newLocation fromLocation:oldLocation];
    }
    if(self.locationDelegate != nil){
        [self.locationDelegate LocationUpdate:locationManager didUpdateToLocation:newLocation fromLocation:oldLocation];
    }
    
//    if ([UIApplication sharedApplication].applicationState == UIApplicationStateBackground){
//        isAllowUploading = YES;
//        [self updateBackgroundLocationPoints];
//        [LocationEventNotifier sharedInstance].timerCounter = 3;
//        [[LogManager sharedInstance] setDebugInfo:[NSString stringWithFormat:@"process events for my places in background (speed:%f km/h)", [self getSpeed]*3.6]];
//        [[LocationEventNotifier sharedInstance] ProcessEventsDetail];
//        [[LogManager sharedInstance] RecordInfoForNonFrequentData:[NSString stringWithFormat:@"process events detail (%f,%f)",[self getCurrentLocation].coordinate.latitude, [self getCurrentLocation].coordinate.longitude]];
//    }
}

@end
