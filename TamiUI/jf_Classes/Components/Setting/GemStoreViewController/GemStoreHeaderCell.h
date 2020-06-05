//
//  GemStoreHeaderCell.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-08-18.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GemStoreHeaderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *redGemCount;
@property (weak, nonatomic) IBOutlet UILabel *blueGemCount;

@end
