//
//  LocationService.h
//  TamiUI
//
//  Created by Admin on 2016-06-25.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <MapKit/MapKit.h>

@protocol LocationServiceDelegate <NSObject>
-(void)LocationUpdate:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;
@end

@interface LocationService : NSObject<CLLocationManagerDelegate>

@property (nonatomic, strong) id<LocationServiceDelegate> delegate;
@property (nonatomic, strong) id<LocationServiceDelegate> locationDelegate;

@property (nonatomic, strong) CLLocationManager *locationManager;
+(LocationService *)sharedInstance;
- (void)requestLocationPermission;
- (CLLocation*)currentLocation;
- (void)startService;
- (void)stopService;

@end
