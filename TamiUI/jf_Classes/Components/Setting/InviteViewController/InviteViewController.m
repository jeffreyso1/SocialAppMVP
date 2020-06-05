//
//  InviteViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-29.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "InviteViewController.h"

@interface InviteViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *qrCodeImage;

@end

@implementation InviteViewController

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
