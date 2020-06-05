//
//  BlipView.m
//  AppX
//
//  Created by admin on 2015-08-14.
//  Copyright (c) 2015 GreenOwl Mobile. All rights reserved.
//

#import "BlipView.h"
#import "UIImage-Ex.h"
#import "Helper.h"

@interface BlipView()
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * offImagePath;
@property (nonatomic, strong) NSString * onImagePath;
@property (nonatomic, strong) NSString * iconPath;
@property (nonatomic, strong) NSString * markerText;
@property (nonatomic, strong) UIColor * onColor;
@property (nonatomic, strong) UIColor * offColor;
@property (nonatomic, assign) BOOL verified;
@end

@implementation BlipView

@synthesize selected;
@synthesize delegate;

-(id)initWithType:(NSString *)type withOffBgImageName:(NSString *)offBGImage withOnBgImageName:(NSString *)onBGImage withIconName:(NSString *)iconName withTitleText:(NSString *)titleText withOnColor:(UIColor *)onColor withOffColor:(UIColor *)offColor withVerified:(BOOL)verified withRect:(CGRect)rect{
    self = [self initWithFrame:rect];
    if (self) {
        selected = NO;
        [self setContentMode:UIViewContentModeRedraw];
        _type = type;
        _offImagePath = offBGImage;
        _onImagePath = onBGImage;
        _iconPath = iconName;
        _markerText = titleText;
        _onColor = onColor;
        _offColor = offColor;
        _verified = verified;
        [self setBackgroundColor:[UIColor clearColor]];
        [self setNeedsDisplay];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    //hard code the size for the marker
    
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfFile:(selected ? _onImagePath : _offImagePath)]];
    [image drawInRect:CGRectMake(3, 3, [self frame].size.width - 3, [self frame].size.height - 3)];
    image = nil;
    
        
    if (_markerText == nil || _markerText.length == 0) {
        UIImage *imageIcon = [[UIImage imageWithData:[NSData dataWithContentsOfFile:_iconPath]] maskImageColor:(selected?_onColor:_offColor)];
        [imageIcon drawInRect:CGRectMake([self frame].size.width/4 + 1.5, [self frame].size.width/4 + 1.5, [self frame].size.width/2, [self frame].size.height/2)];
        imageIcon = nil;
    } else if([_markerText.lowercaseString containsString:@"null"]){
        UIImage *imageIcon = [[UIImage imageWithData:[NSData dataWithContentsOfFile:_iconPath]] maskImageColor:(selected?_onColor:_offColor)];
        [imageIcon drawInRect:CGRectMake([self frame].size.width/4 + 1.5, [self frame].size.width/4 + 1.5, [self frame].size.width/2, [self frame].size.height/2)];
        imageIcon = nil;
    }else {
        _markerText = [_markerText stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        int textSize;
        int textLength = (int)[_markerText length];
        if (textLength == 0) {
            textSize = 15;
        } else if (textLength == 1) {
            textSize = 15;
        } else if (textLength == 2) {
            textSize = 14;
        } else if (textLength == 3) {
            textSize = 13;
        } else if (textLength == 4) {
            textSize = 12;
        } else {
            textSize = 10;
        }
        
        NSDictionary *attributes = @{ NSFontAttributeName: [UIFont systemFontOfSize:textSize weight:UIFontWeightMedium],
                                      NSForegroundColorAttributeName: selected ? [UIColor whiteColor] : _offColor,
                                      NSParagraphStyleAttributeName: paragraphStyle };
        
        CGSize size = [_markerText sizeWithAttributes:attributes];
        CGRect rectText = CGRectMake(([self frame].size.width - size.width) / 2 + 2,
                                     ([self frame].size.width - size.height) / 2 + 2,
                                     size.width,
                                     size.height);
        [_markerText drawInRect:rectText withAttributes:attributes];
    }
    
    CGColorSpaceRelease(colorSpace);
}

-(void)deselectedBlipView{
    selected = NO;
    [self performSelectorOnMainThread:@selector(setNeedsDisplay) withObject:nil waitUntilDone:YES];
    if(delegate != nil){
        [delegate BlipViewDeselected:self];
    }
}

-(void)selectedBlipView{
    selected = YES;
    [self performSelectorOnMainThread:@selector(setNeedsDisplay) withObject:nil waitUntilDone:YES];
    if(delegate != nil){
        [delegate BlipViewSelected:self];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if(selected){
        selected = NO;
        if(delegate != nil){
            [delegate BlipViewDeselected:self];
        }
    }
    else{
        selected = YES;
        if(delegate != nil){
            [delegate BlipViewSelected:self];
        }
    }
    [self setNeedsDisplay];
}

@end
