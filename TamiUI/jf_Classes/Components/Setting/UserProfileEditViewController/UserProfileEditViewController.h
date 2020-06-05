//
//  UserProfileEditViewController.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-14.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/UIKit+AFNetworking.h>

#import "UserProfile.h"

@interface UserProfileEditViewController : UIViewController <UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property UserProfile *selectedUser;

@end
