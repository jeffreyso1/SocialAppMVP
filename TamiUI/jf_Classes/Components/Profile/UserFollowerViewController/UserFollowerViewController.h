//
//  UserFollowerViewController.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-28.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/UIKit+AFNetworking.h>

@protocol UserConnectionPagesDelegate;

@interface UserFollowerViewController : UITableViewController

@property NSArray *followerList;
@property (weak, nonatomic) id<UserConnectionPagesDelegate> pageDelegate;
- (void)searchFollowerWithName:(NSString *)name;

@end

@protocol UserConnectionPagesDelegate <NSObject>

@optional
- (void)didFinishFetchingFollowers:(NSString *)tips;

@end
