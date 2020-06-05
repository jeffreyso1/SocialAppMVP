//
//  SettingViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-21.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "SettingViewController.h"
#import "StoryboardList.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickedBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
