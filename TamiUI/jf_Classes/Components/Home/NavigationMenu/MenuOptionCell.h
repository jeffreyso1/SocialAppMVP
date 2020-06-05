//
//  MenuOptionCell.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-21.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabelKerning.h"

@interface MenuOptionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *optionImage;
@property (weak, nonatomic) IBOutlet UILabelKerning *optionTitle;

@end
