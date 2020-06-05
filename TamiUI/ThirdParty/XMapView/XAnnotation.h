//
//  XAnnotation.h
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

@interface XAnnotation : NSObject
/**
 * icon name, if this image is in bundle, please directly give the icon name.
 * (do not put the same icon name' icon in document folder, because XMapView
 * will look for the icon following the order as below:1) document folder 2) bundle)
 * if this icon is in document folder, plesae give the icon name or directory path
 * for example, if there is a icon (icon.png) in document folder -> subfolder icons
 * please give value, 'icons/icon.png' to iconName. XMapView will automatically look
 * for it in document folder
 */
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
 * mask color is used to color the whole icon, at the same time, it is used to the group circle color
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
 * enable pin animation
 */
@property (nonatomic, assign) BOOL enablePinAnimation;


/**
 * this method is used to update the annotation, especially for the customized pins.
 */
-(void)updateXAnnotation;
@end
