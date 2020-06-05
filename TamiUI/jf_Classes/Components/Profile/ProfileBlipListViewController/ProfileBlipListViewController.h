//
//  ProfileBlipListViewController.h
//  TamiUI
//
//  Created by Jeffrey So on 2016-07-17.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/UIKit+AFNetworking.h>

#import "ProfileBlipPagesViewController.h"

@interface ProfileBlipListViewController : UIViewController <ProfileBlipPage, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic) NSInteger itemIndex;
@property UserProfile *selectedUser;

@end
