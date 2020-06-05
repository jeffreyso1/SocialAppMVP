//
//  UserProfileViewController.h
//  TamiUI
//
//  Created by Admin on 2016-06-21.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/UIKit+AFNetworking.h>
#import <REFrostedViewController/REFrostedViewController.h>

#import "ProfileBlipPagesViewController.h"
#import "UserProfile.h"

@interface UserProfileViewController : UIViewController <ProfileBlipPagesDelegate>

@property UserProfile *selectedUser;

@end
