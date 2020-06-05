//
//  BlipListViewController.h
//  TamiUI
//
//  Created by Admin on 2016-05-25.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/UIKit+AFNetworking.h>

@interface BlipListViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
- (IBAction)clickedClose:(id)sender;

@end
