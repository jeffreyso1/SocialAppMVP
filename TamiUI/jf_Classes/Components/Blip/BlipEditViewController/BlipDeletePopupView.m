//
//  BlipDeletePopupView.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-14.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "BlipDeletePopupView.h"
#import "UIViewController+MJPopupViewController.h"

@interface BlipDeletePopupView ()

@end

@implementation BlipDeletePopupView

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)didClickedConfirm:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickedConfirm:)]) {
        [self.delegate didClickedConfirm:self];
    }
}

- (IBAction)didClickedCancel:(id)sender {
    [self dismissPopupViewController:self animationType:MJPopupViewAnimationFade];
}

@end
