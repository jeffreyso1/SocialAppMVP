//
//  ActivityNotificationCell.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-29.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityNotificationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *blipTypeImage;
@property (weak, nonatomic) IBOutlet UILabel *notificationText;
@property (weak, nonatomic) IBOutlet UILabel *notificationDate;

@end
