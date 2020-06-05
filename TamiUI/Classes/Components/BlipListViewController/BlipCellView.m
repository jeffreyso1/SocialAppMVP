//
//  BlipCellView.m
//  TamiLab
//
//  Created by Admin on 2016-05-26.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "BlipCellView.h"
#import "UIImage+Scale.h"
#import "UIImage+AFNetworking.h"

@implementation BlipCellView

#define DEVICE_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) && !(DeviceSystemMajorVersion() < 7)
#define DEVICE_IPAD_6ANDBELOW (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) && (DeviceSystemMajorVersion() < 7)

#define DEVICE_IPHONE !(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) && !(DeviceSystemMajorVersion() < 7)
#define DEVICE_IPHONE_6ANDBELOW !(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) && (DeviceSystemMajorVersion() < 7)

NSUInteger DeviceSystemMajorVersion();
NSUInteger DeviceSystemMajorVersion() {
    static NSUInteger _deviceSystemMajorVersion = -1;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _deviceSystemMajorVersion = [[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue];
    });
    return _deviceSystemMajorVersion;
}

//Metallic grey gradient background
- (CAGradientLayer*) whiteGradient {
    CAGradientLayer *gradientMask = [CAGradientLayer layer];
    gradientMask.frame = self.bounds;
    gradientMask.colors = @[(id)[UIColor whiteColor].CGColor,
                            (id)[UIColor clearColor].CGColor];
    return gradientMask;
}
- (CAGradientLayer*) greyGradient {
    
    UIColor *colorOne = [UIColor colorWithWhite:0.9 alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.85 alpha:1.0];
    UIColor *colorThree     = [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.7 alpha:1.0];
    UIColor *colorFour = [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.4 alpha:1.0];
    
    NSArray *colors =  [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, colorThree.CGColor, colorFour.CGColor, nil];
    
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:0.02];
    NSNumber *stopThree     = [NSNumber numberWithFloat:0.99];
    NSNumber *stopFour = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, stopThree, stopFour, nil];
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.colors = colors;
    //    headerLayer.locations = locations;
    headerLayer.frame = self.bounds;
    
    return headerLayer;
    
}
- (CAGradientLayer*) alphaGradient {
    // Create a gradient layer that goes transparent -&gt; opaque
    CAGradientLayer *alphaGradientLayer = [CAGradientLayer layer];
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)[UIColor clearColor],
                       (id)[UIColor blackColor],
                       
                       nil];
    [alphaGradientLayer setColors:colors];
    
    // Start the gradient at the bottom and go almost half way up.
    [alphaGradientLayer setStartPoint:CGPointMake(0.0f, 1.0f)];
    [alphaGradientLayer setEndPoint:CGPointMake(0.0f, 0.6f)];
    
    // Create a image view for the topImage we created above and apply the mask
    //statusBarView = [[UIImageView alloc] initWithImage:topImage];
    [alphaGradientLayer setFrame:[self bounds]];
    //[[statusBarView layer] setMask:alphaGradientLayer];
    
    //// Finally, add the masked image view on top of our collection view
    //[[self view] addSubview:statusBarView];
    //[statusBarView release]
    return alphaGradientLayer;
}
//Blue gradient background
- (CAGradientLayer*) blueGradient {
    
    UIColor *colorOne = [UIColor colorWithRed:(120/255.0) green:(135/255.0) blue:(150/255.0) alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(57/255.0)  green:(79/255.0)  blue:(96/255.0)  alpha:1.0];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.colors = colors;
    //    headerLayer.locations = locations;
    headerLayer.frame=self.bounds;
    return headerLayer;
    
}

-(void)drawWithGradientOverlay:(UIImage*)image withRect:(CGRect)rect {
    //Create a layer that holds your background image and add it as sublayer of your self.layer
    CALayer *layer = [CALayer layer];
    layer.frame = self.layer.frame;
    //    layer.contents = (id)[UIImage imageNamed:@"background.png"].CGImage;
    layer.contents=(id)image.CGImage;
    [self.layer addSublayer:layer];
    
    //Create your CAGradientLayer
    CAGradientLayer *gradientOverlay = [CAGradientLayer layer];
    CGColorRef grayColor = [UIColor colorWithRed:37/255.f green:37/255.f
                                            blue:37/255.f alpha:1.0].CGColor;
    CGColorRef blueColor = [UIColor colorWithRed:23.0/255.0 green:171.0/255.0
                                            blue:219.0/255.0 alpha:1.0].CGColor;
    gradientOverlay.colors = [NSArray arrayWithObjects:
                              (id) CFBridgingRelease(grayColor),
                              (id) CFBridgingRelease(grayColor),
                              (id) CFBridgingRelease(blueColor),
                              nil];
    gradientOverlay.locations = [NSArray arrayWithObjects:
                                 [NSNumber numberWithFloat:0],
                                 [NSNumber numberWithFloat:0.4],
                                 [NSNumber numberWithFloat:1],
                                 nil];
    //    CGRect rect=CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    CGPoint startPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMidY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMidY(rect));
    
    gradientOverlay.startPoint = startPoint;
    gradientOverlay.frame = self.layer.frame;
    gradientOverlay.endPoint = endPoint;
    //set its opacity from 0 ~ 1
    gradientOverlay.opacity = 0.6f;
    //add it as sublayer of self.layer (it will be over the layer with the background image
    [self.layer addSublayer:gradientOverlay];
    
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
#define LEFT_COLUMN_OFFSET 10
#define MIDDLE_COLUMN_OFFSET 170
#define RIGHT_COLUMN_OFFSET 270
    
#define UPPER_ROW_TOP 12
#define LOWER_ROW_TOP 44
    
    // Color for the main text items (time zone name, time).
    UIColor *mainTextColor;
    
    // Color for the secondary text items (GMT offset, day).
    UIColor *secondaryTextColor;
    
    // Choose font color based on highlighted state.
    if (self.highlighted) {
        mainTextColor = [UIColor whiteColor];
        secondaryTextColor = [UIColor whiteColor];
    }
    else {
        mainTextColor = [UIColor blackColor];
        secondaryTextColor = [UIColor darkGrayColor];
    }
    
    /*
     Font attributes for the main text items (time zone name, time).
     For iOS 7 and later, use text styles instead of system fonts.
     */
    UIFont *mainFont;
    if (DeviceSystemMajorVersion() > 6) {
        mainFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    }
    else {
        mainFont = [UIFont systemFontOfSize:17.0];
    }
    
    NSDictionary *mainTextAttributes = @{ NSFontAttributeName : mainFont, NSForegroundColorAttributeName : mainTextColor };
    
    // Font attributes for the secondary text items (GMT offset, day).
    UIFont *secondaryFont;
    if (DeviceSystemMajorVersion() > 6) {
        secondaryFont = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    }
    else {
        secondaryFont = [UIFont systemFontOfSize:12.0];
    }
    NSDictionary *secondaryTextAttributes = @{ NSFontAttributeName : secondaryFont, NSForegroundColorAttributeName : secondaryTextColor };
    
    
    // In this example we will never be editing, but this illustrates the appropriate pattern.
    if (!self.editing) {
        
        CGPoint point;
        
        /*
         Draw the locale name top left.
         */
        //        NSAttributedString *localeNameAttributedString = [[NSAttributedString alloc] initWithString:self.timeZoneWrapper.localeName attributes:mainTextAttributes];
        //        point = CGPointMake(LEFT_COLUMN_OFFSET, UPPER_ROW_TOP);
        //        [localeNameAttributedString drawAtPoint:point];
        
        /*
         Draw the current time in the middle column.
         */
        
        /*
         Draw the abbreviation botton left.
         */
        //        NSAttributedString *abbreviationAttributedString = [[NSAttributedString alloc] initWithString:self.abbreviation attributes:secondaryTextAttributes];
        //        point = CGPointMake(LEFT_COLUMN_OFFSET, LOWER_ROW_TOP);
        //        [abbreviationAttributedString drawAtPoint:point];
        
        /*
         Draw the whichDay string.
         */
        //        APLTimeZoneWrapper *timeZoneWrapper = self.timeZoneWrapper;
        //
        //        NSAttributedString *whichDayAttributedString = [[NSAttributedString alloc] initWithString:timeZoneWrapper.whichDay attributes:secondaryTextAttributes];
        //        point = CGPointMake(MIDDLE_COLUMN_OFFSET, LOWER_ROW_TOP);
        //        [whichDayAttributedString drawAtPoint:point];
        //
        //
        // Draw the quarter image.
        if (FALSE) {
            //        NSURL *URL = [NSURL URLWithString:@"http://example.com"];
            NSURL *URL = [NSURL URLWithString:self.wrapper.imageName];
            NSURLRequest *request = [NSURLRequest requestWithURL:URL];
            
            NSURLSession *session = [NSURLSession sharedSession];
            NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                // ...
                //            UIImage *image = [UIImage imageWithData:data];
                UIImage *img = [[UIImage alloc] initWithData:data];
                [img drawAtPoint:CGPointMake(0, 0)];
                
            }];
            
            [task resume];
        }
        else {
            if (self.scaledImage == nil) {
                NSURL *url = [NSURL URLWithString:self.wrapper.imageName];        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
                
                NSData *data = [NSData dataWithContentsOfURL:url];
                UIImage *img = [[UIImage alloc] initWithData:data];
                //            [img drawAtPoint:CGPointMake(0, 0)];
                float ratio=self.bounds.size.width/img.size.width;
                CGSize newSize=CGSizeMake(self.bounds.size.width, img.size.height*ratio);
                
                self.scaledImage = [img scaleImageToSize:newSize];
            }
            self.layer.mask = [self greyGradient];
            [self.scaledImage drawAtPoint:point];
            
//            [self.layer insertSublayer:[self alphaGradient] atIndex:0];
//            
            
            
            
        }
        NSString *timeString = self.wrapper.text;
        NSAttributedString *timeAttributedString = [[NSAttributedString alloc] initWithString:timeString attributes:mainTextAttributes];
        point = CGPointMake(LEFT_COLUMN_OFFSET, LOWER_ROW_TOP);
        [timeAttributedString drawAtPoint:point];
        
    }
    
}
@end
