//
//  BlipPopupViewController.h
//  TamiUI
//
//  Created by Admin on 2016-06-25.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlipPopupViewController : UIViewController<UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImageView *headImage;
@property (strong, nonatomic) IBOutlet UITextView *blipShortText;

@end
