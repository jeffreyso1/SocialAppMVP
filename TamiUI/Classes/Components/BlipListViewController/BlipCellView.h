//
//  BlipCellView.h
//  TamiLab
//
//  Created by Admin on 2016-05-26.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlipCellWrapper.h"

@interface BlipCellView : UIView
@property (nonatomic,assign) BOOL *highlighted;
@property (nonatomic,assign) BOOL *editing;
@property (nonatomic,strong) BlipCellWrapper* wrapper;
@property (nonatomic,strong) UIImage* scaledImage;
@end
