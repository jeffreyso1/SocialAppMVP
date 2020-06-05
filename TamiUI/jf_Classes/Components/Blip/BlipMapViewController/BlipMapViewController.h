//
//  BlipMapViewController.h
//  Tami
//
//  Created by Roman Mironenko on 2016-07-01.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/UIKit+AFNetworking.h>
#import <DateTools/NSDate+DateTools.h>
#import <MapKit/MKMapView.h>
#import "XMapView.h"
#import "LocationService.h"

@interface BlipMapViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, XMapViewDelegate, LocationServiceDelegate>


@end
