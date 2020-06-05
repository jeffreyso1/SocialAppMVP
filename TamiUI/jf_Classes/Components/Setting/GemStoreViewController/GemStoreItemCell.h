//
//  GemStoreItemCell.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-08-18.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GemStoreItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *itemPrice;
@property (weak, nonatomic) IBOutlet UILabel *gemCount;
@property (weak, nonatomic) IBOutlet UILabel *bonusGemCount;
@property (weak, nonatomic) IBOutlet UILabel *bonusItemInfo;

@end
