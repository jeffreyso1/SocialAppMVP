//
//  SimpleMapViewController.h
//  TamiUI
//
//  Created by Admin on 2016-06-21.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MKMapView.h>
#import "BlipPopupViewController.h"
#import "XMapView.h"
#import "LocationService.h"
#import "BlipView.h"

@interface SimpleMapViewController : UIViewController<UIGestureRecognizerDelegate, XMapViewDelegate, LocationServiceDelegate,BlipViewDelegate>
@property (strong, nonatomic) IBOutlet XMapView *xMapView;

@property (strong, nonatomic) IBOutlet UIView *launchPadView;
@property (strong, nonatomic) BlipPopupViewController *blipPopup;
@property (strong, nonatomic) CLLocation *lastLocation;

@property (nonatomic, strong) XMapAnnotation * userLocation;

- (IBAction)clickButton:(id)sender;
@property (nonatomic, assign) MKCoordinateRegion boundingRegion;
@end
