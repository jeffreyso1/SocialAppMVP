//
//  Label.h
//  AppX
//
//  Created by admin on 2015-12-29.
//  Copyright © 2015 GreenOwl Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;
@interface Label : UILabel
@property (nonatomic, readwrite) VerticalAlignment verticalAlignment;
@end
