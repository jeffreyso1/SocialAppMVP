//
//  AccountSettingViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-14.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "AccountSettingViewController.h"

@interface AccountSettingViewController ()

@end

@implementation AccountSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickedBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickedSave:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
