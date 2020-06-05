//
//  UserActivityNotificationCell.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-08-19.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserActivityNotificationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *gems;
@property (weak, nonatomic) IBOutlet UILabel *notificationText;
@property (weak, nonatomic) IBOutlet UILabel *notificationDate;

@end
