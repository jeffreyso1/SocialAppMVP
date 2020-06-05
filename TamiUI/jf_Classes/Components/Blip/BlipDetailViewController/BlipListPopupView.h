//
//  BlipListPopupView.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-19.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BlipListPopupDelegate;

@interface BlipListPopupView : UIViewController

@property (weak, nonatomic) id <BlipListPopupDelegate>delegate;
@property NSArray *blipTags;

@end

@protocol BlipListPopupDelegate <NSObject>

@optional
- (void)didSelectedTagWithName:(NSString *)name;

@end
