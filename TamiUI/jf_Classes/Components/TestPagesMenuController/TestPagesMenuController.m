//
//  TestPagesMenuController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-04.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "TestPagesMenuController.h"
#import "UserProfileViewController.h"

#import "UserProfile.h"
#import "DatabaseDAO.h"
#import "TestDataManager.h"
#import "StoryboardList.h"

#import "UIColor+fromHex.h"

@interface TestPagesMenuController ()

@property UserProfile *selectedUser;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation TestPagesMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Fake user login
    //On production, store self userinfo after some login mechanism, [FMDBManager resetTable] when logout
    if ([DatabaseDAO getCurrentUser] == nil) {
        [[TestDataManager sharedInstance] getUserProfileSelf:^(NSURLResponse *response, id responseObject, NSError *error) {
            UserProfile *userInfo = [UserProfile yy_modelWithJSON:responseObject];
            [DatabaseDAO addCurrentUser:userInfo];
        }];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Button Action

- (IBAction)clickedProfileSelf:(id)sender {
    [[TestDataManager sharedInstance] getUserProfileSelf:^(NSURLResponse *response, id responseObject, NSError *error) {
        UserProfileViewController *vc = [[StoryboardList testPagesStoryboard] instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
        vc.selectedUser = [UserProfile yy_modelWithJSON:responseObject];
        [self.navigationController pushViewController:vc animated:YES];
    }];
}

- (IBAction)clickedProfileOther:(id)sender {
    [[TestDataManager sharedInstance] getUserProfileOther:^(NSURLResponse *response, id responseObject, NSError *error) {
        UserProfileViewController *vc = [[StoryboardList testPagesStoryboard] instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
        vc.selectedUser = [UserProfile yy_modelWithJSON:responseObject];
        [self.navigationController pushViewController:vc animated:YES];
    }];
}

- (IBAction)clickedClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
