//
//  BlipCommentCell.h
//  Tami
//
//  Created by Roman Mironenko on 2016-06-29.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlipCommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *commenterIcon;
@property (weak, nonatomic) IBOutlet UILabel *commentedBy;
@property (weak, nonatomic) IBOutlet UILabel *commentText;
@property (weak, nonatomic) IBOutlet UILabel *timesAgo;

@end
