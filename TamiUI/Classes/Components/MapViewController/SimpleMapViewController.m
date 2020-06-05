//
//  SimpleMapViewController.m
//  TamiUI
//
//  Created by Admin on 2016-06-21.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "SimpleMapViewController.h"
#import "LocationService.h"
#import "BlipModel.h"
#import "TestDataManager.h"
#import "UIColor+fromHex.h"
#import "Helper.h"



@interface SimpleMapViewController ()
@property (nonatomic, strong) NSLock * renderMarkerLocker;
@end

@implementation SimpleMapViewController


@synthesize renderMarkerLocker;
@synthesize xMapView;
@synthesize blipPopup;
@synthesize userLocation;
@synthesize lastLocation;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    [xMapView initialize];
    
    //step 2
    //set up related parameters for XMapView
    xMapView.clusteringGroupNrofPins = 5;   //set up the number of group
    //that means, after 5 pins in a group
    //XMapView will start to cluster them
    
    xMapView.clusteringRadius = 80;         //set up the radius for a set of pins
    //in a screen the unit for this
    //one is pixels compare to screen resolution.
    
    xMapView.enableClusteringRadiusAutoAdjust = NO;
    //by default, auto radius is enabled
    //it indicates XMapView to cluster pins
    //based on Map Zoom Level
    
    // Map Location Init
    
    [self locateMe];
    
    blipPopup=[[BlipPopupViewController alloc]initWithNibName:@"BlipPopupViewController" bundle:nil];
    CGRect frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height-230, [UIScreen mainScreen].bounds.size.width, 150);
    [blipPopup.view setFrame:frame];
    [self.xMapView addSubview:blipPopup.view];
    //    [self.view bringSubviewToFront:blipPopup.view];
    // Location Service Delegate
    [LocationService sharedInstance].locationDelegate=self;
    
    UITapGestureRecognizer *userTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [userTapGesture setDelegate:self];
    [self.view addGestureRecognizer:userTapGesture];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)clickButton:(id)sender {
    NSLog(@"Tag:%ld",[sender tag]);
    switch ([sender tag]) {
        case 0:
            //            if (_launchPadView.hidden) {
            //                _launchPadView.hidden=NO;
            //                blipPopup.view.hidden=NO;
            //            }
            //            else {
            //                _launchPadView.hidden=YES;
            //                blipPopup.view.hidden=YES;
            //            }
            [self toggleDisplayPopUp:_launchPadView.hidden];
            break;
        case 1:
            // Locate me
            [self locateMe];
            break;
        case 2:
            // reLoad
            break;
        case 3:
            // audio toggle
            break;
        case 4:
            // zoom button
            break;
        case 99:
            // Close Button
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        default:
            break;
    }
}


- (void)locateMe {
    //    [self.xMapView setRegion:self.boundingRegion animated:YES];
    [xMapView setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake([[LocationService sharedInstance] currentLocation].coordinate.latitude, [[LocationService sharedInstance] currentLocation].coordinate.longitude), MKCoordinateSpanMake(0.025, 0.025)) animated:YES];
}

-(void)handleTapGesture:(UITapGestureRecognizer *)gesture {
    [self toggleDisplayPopUp:NO];
}

-(void)toggleDisplayPopUp:(BOOL)show {
    _launchPadView.hidden=!show;
    if (!blipPopup.view.hidden)
        blipPopup.view.hidden=!show;
}

#pragma LocationServicesDelegate
-(void)LocationUpdate:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    if(newLocation != nil){
        lastLocation = [[CLLocation alloc] initWithLatitude:newLocation.coordinate.latitude longitude:newLocation.coordinate.longitude];
        //        [self LocationUpdateBasedOnGPS:newLocation.coordinate.latitude longitude:newLocation.coordinate.longitude];
        MKMapRect mRect = MKMapRectInset(xMapView.visibleMapRect, xMapView.visibleMapRect.size.width/5, xMapView.visibleMapRect.size.height/5);
        MKMapPoint neMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), mRect.origin.y);
        MKMapPoint swMapPoint = MKMapPointMake(mRect.origin.x, MKMapRectGetMaxY(mRect));
        CLLocationCoordinate2D neCoord = MKCoordinateForMapPoint(neMapPoint);
        CLLocationCoordinate2D swCoord = MKCoordinateForMapPoint(swMapPoint);
        BOOL needToReCenter = NO;
        if(newLocation.coordinate.latitude < swCoord.latitude || newLocation.coordinate.longitude< swCoord.longitude){
            needToReCenter = YES;
        }
        if(newLocation.coordinate.latitude > neCoord.latitude || newLocation.coordinate.longitude> neCoord.longitude){
            needToReCenter = YES;
        }
        if(needToReCenter)
        {
            //            if(_allowFollowingMe)
            //            {
            //                [xMapView setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude), MKCoordinateSpanMake(xMapView.region.span.latitudeDelta, xMapView.region.span.longitudeDelta)) animated:YES];
            //
            //            }
        }
    }
}

-(void)xmapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    NSLog(@"regionDidChangeAnimated");
}

-(void)xmapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
    NSLog(@"regionWillChangeAnimated");
}
#pragma XMapView Delegate
-(void)xmapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views{
    for (MKAnnotationView *view in views){
        if(view != NULL){
            if([view isKindOfClass:[XMapAnnotationView class]]){
                XMapAnnotationView * xView = (XMapAnnotationView *)view;
                if([xView.clustringGroupName compare:@"USER_LOCATION"] == 0){
                    userLocation = (XMapAnnotation *)(xView.annotation);
                    [[view superview] bringSubviewToFront:view];
                }
            }
        }
    }
}

-(MKOverlayRenderer *)xmapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKPolylineRenderer* lineView = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    lineView.strokeColor = [UIColor blueColor];
    lineView.lineWidth = 4;
    return lineView;
}

-(void)xmapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if([view.annotation isKindOfClass:[MKUserLocation class]]){return;}
    XMapAnnotation * annotation = (XMapAnnotation *)view.annotation;
    
    [((BlipView *)((XMapAnnotationView *)view).customizedView) selectedBlipView];
    dispatch_async(dispatch_get_main_queue(), ^{
        [((BlipView *)((XMapAnnotationView *)view).customizedView) setNeedsDisplay];
    });
    
    if(annotation.pinCategory == XPinClustering){return;
    } else if ([[annotation pinTag] isEqualToString:@"USER_LOCATION"] ) {
        return;
    }
    
}

-(MKAnnotationView *)xmapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{return nil;}
-(void)xmapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{}

@end
