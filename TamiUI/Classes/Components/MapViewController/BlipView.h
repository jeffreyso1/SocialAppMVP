//
//  BlipView.h
//  AppX
//
//  Created by admin on 2015-08-14.
//  Copyright (c) 2015 GreenOwl Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+fromHex.h"
#import "Helper.h"
@class BlipView;
@protocol BlipViewDelegate
-(void)BlipViewSelected:(BlipView *) marker;
-(void)BlipViewDeselected:(BlipView *)marker;
@end

@interface BlipView : UIView
@property (nonatomic, strong) id<BlipViewDelegate> delegate;


-(id)initWithType:(NSString *)type withOffBgImageName:(NSString *)offBGImage withOnBgImageName:(NSString *)onBGImage withIconName:(NSString *)iconName withTitleText:(NSString *)titleText withOnColor:(UIColor *)onColor withOffColor:(UIColor *)offColor withVerified:(BOOL)verified withRect:(CGRect)rect;
-(void)deselectedBlipView;
-(void)selectedBlipView;
@end
