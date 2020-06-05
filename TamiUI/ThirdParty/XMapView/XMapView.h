//
//  XMapView.h
//  Version   : 1.3.1
//  Created by: Xu Liu
//  Email     : me@xuliu.info
//
//  This is one of class for clustering the pins in the MKMapView compoenent for everyone to use
//  under GPL license. When you use this class, please respect the author and keep author's
//  infomation in this class. If you need more information about this class, please visit
//  the website:http://www.xuliu.info/xMapView.html
//

#import <MapKit/MapKit.h>
#import "XMapAnnotation.h"
#import "XMapAnnotationView.h"
#import "XMapClusteringCircle.h"
#import "XAnnotation.h"

typedef NS_ENUM(NSUInteger, XPinCategory) {
    XPinClustering = -1,
    XPinNormal = 0
};

@protocol XMapViewDelegate <NSObject>
- (void)xmapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation;
-(MKAnnotationView *)xmapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation;
-(void)xmapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views;
-(MKOverlayRenderer *)xmapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay;
-(void)xmapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view;
-(void)xmapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated;
-(void)xmapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated;
@end

@interface XMapView : MKMapView <MKMapViewDelegate>
@property (nonatomic, strong) id<XMapViewDelegate> xdelegate;
/**
 * set up the radius for a set of pins to be clustered.
 * the unit for this radius is pixel in a screen.
 * that is to say, if you set the value to 60. that means,
 * based on a given (XMapView automatically pick it up) and then, within 60 pixels
 * if there are pins, they will be clustered.
 * by default ,the value is 60, if you want to have less cluster for the pin,
 * just increase the radius of this value
 */
@property (nonatomic, assign) double clusteringRadius;

/**
 * set up the size of the group. that is to say,
 * at least how many pins in a group, we consider to start to cluster
 * here in a group means, the pins in a the same radius.
 * by default, the value is 5. if the value is 999, that means at least 999 pins in a group
 * XMapView will consider to group them
 */
@property (nonatomic, assign) int clusteringGroupNrofPins;

/**
 * this feature by default is YES; it means when the user click the clustering pin, the map will zoom to the level that show all the related subset pins. if it is no, when user click the clustering, nothing happend.
 */
@property (nonatomic, assign) BOOL enableClusteringPinZoom;

/**
 * this is a flag, by default it is false.If this flag is true.
 * that means, even there are several groups in the map. but it treat all group
 * as one group. but user still can use group name to hide or show a certain group
 */
@property (nonatomic, assign) BOOL ignoreGroupTag;

/**
 *  this is a flag to indicate the mode of updating the pins in the map
 * there are two modes in the xmapview to update pins, 1) redrew, 2) refresh.
 * by default, this variable is YES; that means the map will update pins based on refresh,
 * namely, if some pins are there, xmapview will skip them and only draw the ones not in the map
 * by redraw mode, every pins will be destroied and redraw. if want to enable redraw, need to set it 
 * to NO value.
 */
@property (nonatomic, assign) BOOL regionPinsUpdateByRefresh;

/**
 * by default, this value is true, that is to say, based on the users clusteringRadius value
 * XMapView will automatically adjust the radius based on the zoom level of the map
 * otherwise, if the value is false, XMapView always clusters the pins based on the clusteringRadius
 */
@property (nonatomic, assign) BOOL enableClusteringRadiusAutoAdjust;

//used for saving users xannotation information
@property (nonatomic, strong) NSMutableArray * xAnnotationContainer;

//used for saving pins in the map
@property (nonatomic, strong) NSMutableArray * xAnnotationsInMap;
@property (nonatomic, strong) NSLock * xAnnotationsInMapLocker;

/**
 * threashold value for control the refresh time in the pin when user zoom in and zoom out the mapview
 * by default it is 200 pins in the map, that means, if the total pins in the map over than 200,
 * the map refresh waiting time will increase from 0.5 to 1 seconds.
 */
@property (nonatomic, assign) int thresholdForRefreshTime;
@property (nonatomic, assign) double refreshIntervalForPins;    //this is a vairable for internal use

/**
 * hide a certain number of group and forbid them to show in the map
 * if want to hide a group, just add the clustering group name in this variable
 * if we want to show them again, remove the group name from this variable
 */
@property (nonatomic, strong) NSMutableArray * needToHideGroups;

/**
 * enable or disable pin selected animation. by default it is enabled
 **/
@property (nonatomic, assign) BOOL enablePinSelectedAnimation;

-(void)addXAnnotation:(XAnnotation *)annotation;
-(void)addXAnnotations:(NSArray *)annotations;
-(void)removeXAnnotationById:(NSString *)xannotationId;
-(void)removeXAnnotations:(NSArray *)annotationIds;
-(void)removeAllXAnnotations;

/**
 * force to refresh the pins of an area
 */
-(void)refreshAnnotationsInMap;

/**
 * force to redraw all the pins of an area
 */
-(void)redrawAnnotationsInMap;


/**
 * reload annotations from data source
 */
-(void)reloadAnnotationsInMap;

/**
 * get current map zoom level
 */
-(int)getZoomLevel;

/**
 * initialize the XMapView first, before using it
 */
-(void)initialize;
@end


