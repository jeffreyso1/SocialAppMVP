//
//  UserFollowingViewController.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-28.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/UIKit+AFNetworking.h>
#import "UserFollowerViewController.h"

@interface UserFollowingViewController : UITableViewController

@property NSArray *followerList;
@property (weak, nonatomic) id<UserConnectionPagesDelegate> pageDelegate;
- (void)searchFollowingWithName:(NSString *)name;

@end
