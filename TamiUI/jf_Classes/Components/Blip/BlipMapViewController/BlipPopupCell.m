//
//  BlipPopupCell.m
//  Tami
//
//  Created by Roman Mironenko on 2016-07-01.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import "BlipPopupCell.h"

@implementation BlipPopupCell
const int BPUCellHeight = 130;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"BlipPopupCell" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}
@end
