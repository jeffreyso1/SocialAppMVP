//
//  BlipEditViewController.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-14.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/UIKit+AFNetworking.h>

#import "BlipDeletePopupView.h"
#import "BlipDetail.h"
#import "BlipTag.h"

@interface BlipEditViewController : UIViewController <BlipDeletePopupDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property BlipDetail *selectedBlip;

@end
