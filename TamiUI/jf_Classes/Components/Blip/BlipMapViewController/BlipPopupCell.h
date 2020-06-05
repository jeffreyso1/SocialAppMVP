//
//  BlipPopupCell.h
//  Tami
//
//  Created by Roman Mironenko on 2016-07-01.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlipPopupCell : UICollectionViewCell
extern const int BPUCellHeight;
@property (weak, nonatomic) IBOutlet UIImageView *blipBannerImage;
@property (weak, nonatomic) IBOutlet UIImageView *creatorThumbnail;
@property (weak, nonatomic) IBOutlet UILabel *creatorName;
@property (weak, nonatomic) IBOutlet UILabel *heartCount;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;
@property (weak, nonatomic) IBOutlet UILabel *blipBody;
@property (weak, nonatomic) IBOutlet UILabel *timesAgo;

@end
