//
//  UserFollowerCell.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-28.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserFollowerCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userThumbnail;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userSubtitle;
@property (weak, nonatomic) IBOutlet UIButton *followButton;

@end
