//
//  BlipDeletePopupView.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-14.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BlipDeletePopupDelegate;

@interface BlipDeletePopupView : UIViewController

@property (weak, nonatomic) id <BlipDeletePopupDelegate>delegate;

@end

@protocol BlipDeletePopupDelegate <NSObject>

@optional
- (void)didClickedConfirm:(BlipDeletePopupView *)view;

@end
