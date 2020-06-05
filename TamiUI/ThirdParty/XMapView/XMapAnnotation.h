//
//  XMapAnnotation.h
//  Version   : 1.3.1
//  Created by: Xu Liu
//  Email     : me@xuliu.info
//
//  This is one of class for clustering the pins in the MKMapView compoenent for everyone to use
//  under GPL license. When you use this class, please respect the author and keep author's
//  infomation in this class. If you need more information about this class, please visit
//  the website:http://www.xuliu.info/xMapView.html
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface XMapAnnotation : MKPointAnnotation
// this is a type used to indicate this is a group pin
// or this is a pin, by default it is a normal pin
// 0 = normal pin, -1 clustering pin
@property (nonatomic, assign) int pinCategory;

/**
 * pin period flag, which is used to identify a clustering in the same period
 * developers do not need to take care of this vairable.
 */
@property (nonatomic, strong) NSString * periodFlag;

@property (nonatomic, strong) NSString * iconName;

@property (nonatomic, assign) double pinWidth;
@property (nonatomic, assign) double pinHeight;
@property (nonatomic, assign) double pinAnchorX;
@property (nonatomic, assign) double pinAnchorY;

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
@property (nonatomic, strong) NSString * uniqueId;

/**
 * pinTag is reserved for user to filter pin information.
 */
@property (nonatomic, strong) NSString * pinTag;
@property (nonatomic, strong) NSString * clustringGroupName;

/**
 * this is a property which indicate that, currently, you want to show icon or use your own view.
 * by default it is set to false, it uses icon to show in the map. while make this value to true.
 * the pin will use customized view to use. be careful, use customized view may result a huge number of
 * memory when there are many pins in the map
 */
@property (nonatomic, assign) BOOL enableCustomizedView;
@property (nonatomic, strong) UIView * customizedView;

/**
 * this is a value indicated that, whether this pin will respect the clustering or not.
 * by default this is enabled
 */
@property (nonatomic, assign) BOOL canBeClustered;

/**
 * if mask color is enabled, the pin will be colored by the icon mask color
 */
@property (nonatomic, assign) BOOL enableMaskColor;

/**
 * mask color only has effect when the enable Mask Color is true. by default, it is false
 */
@property (nonatomic, strong) UIColor * iconMaskColor;

/**
 * this is used to define the font color for the group number text
 */
@property (nonatomic, strong) UIColor * iconFontColor;

/**
 * extra paramters for user to save their own information
 */
@property (nonatomic, strong) NSMutableDictionary * extraParameters;

/**
 * set up the default bundle path for the xMapView, if doesn't set this variable, it will use the bundle default path
 */
@property (nonatomic, strong) NSString * bundlePath;

/**
 * set up the default doument path for the xMapView, if doesn't set this variable, it will use the document default path
 */
@property (nonatomic, strong) NSString * documentPath;

/**
 * clustering annotation area, this is a top,left, bottom, right latitude longitude value. which is used for the clustering pin. normal pin doesn't need this area. clustering pin uses this value to decide the bound
 */
@property (nonatomic, assign) CGRect subsetArea;
/**
 * clustering annotation area, indicates the pin ids within the subsetArea;
 */
@property (nonatomic, strong) NSMutableArray * subsetAreaPinIds;

/**
 * it is used to animate the pins (latitude) when render it to the map. user noramlly donot need to change it
 * this anmated latitude allows user to set up the pin in a position and when the pin is added ,the pin will move from 
 * this start place to the original latitude place
 */
@property (nonatomic, assign) double startAnimationLatitude;

/**
 * it is used to animate the pins (longitude) when render it to the map. user noramlly donot need to change it
 * this anmated latitude allows user to set up the pin in a position and when the pin is added ,the pin will move from
 * this start place to the original latitude place
 */
@property (nonatomic, assign) double startAnimationLongitude;

/**
 * reset subset area for clustering annotation area to -1, and clear the subsetAreaPinIds it is useful for the clustering pin.
 */
-(void)resetSubsetArea;


/**
 * enable pin animation
 */
@property (nonatomic, assign) BOOL enablePinAnimation;
@end
