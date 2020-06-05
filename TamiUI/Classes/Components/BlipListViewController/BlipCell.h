//
//  BlipTableViewCell.h
//  TamiLab
//
//  Created by Admin on 2016-05-26.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlipCellWrapper.h"
#import "BlipCellView.h"

@interface BlipCell : UITableViewCell
@property (nonatomic,strong) BlipCellWrapper* wrapper;

@property (strong, nonatomic) IBOutlet BlipCellView *cellView;
-(void)setData:(BlipCellWrapper*)data;
@end
