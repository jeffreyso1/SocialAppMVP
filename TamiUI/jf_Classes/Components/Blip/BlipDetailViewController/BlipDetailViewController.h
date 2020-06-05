//
//  BlipDetailViewController.h
//  Tami
//
//  Created by Roman Mironenko on 2016-06-29.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/UIKit+AFNetworking.h>
#import <DateTools/NSDate+DateTools.h>
#import <NYTPhotoViewer/NYTPhotosViewController.h>
#import <YYText/YYText.h>

#import "BlipListPopupView.h"

#import "BlipDetail.h"
#import "BlipTag.h"
#import "BlipComment.h"

@interface BlipDetailViewController : UIViewController <BlipListPopupDelegate>

@property (nonatomic) BlipDetail *selectedBlip;
@property (nonatomic) NSUInteger itemIndex;


@end
