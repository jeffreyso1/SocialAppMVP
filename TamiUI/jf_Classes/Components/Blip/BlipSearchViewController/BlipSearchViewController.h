//
//  BlipSearchViewController.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-27.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/UIKit+AFNetworking.h>
#import <YYText/YYText.h>

@interface BlipSearchViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

- (void)searchTagsWithTag:(NSString *)tag;
- (void)searchBlipsWithTag:(NSString *)tag;

@end
