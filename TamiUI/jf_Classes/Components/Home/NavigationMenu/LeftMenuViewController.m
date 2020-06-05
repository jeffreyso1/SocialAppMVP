//
//  LeftMenuViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-21.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "UserProfileViewController.h"
#import "MenuOptionCell.h"
#import "DatabaseDAO.h"
#import "UserProfile.h"

#import "StoryboardList.h"

@interface LeftMenuViewController ()

@property NSArray *optionList;
@property NSArray *optionImage;
@property (weak, nonatomic) IBOutlet UIView *topOffset;

@end

@implementation LeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.optionList = @[@"HOME", @"DASHBOARD", @"ACTIVITY", @"FAVOURITES", @"SETTINGS", @"FEEDBACKS"];
    self.optionImage = @[@"Nav-Home", @"Nav-Dashboard", @"Nav-Activity", @"Nav-Favourites", @"Nav-Settings", @"Nav-Feedback"];
    //this adjust the offset at the top of menu manually
    //from the specification, estimated to around 1/7 of screen size (e.g. offset will be smaller on iphone 4s, and bigger on iphone 6)
    //items left offset can also be adjust in MenuOptionCell.xib
    //adjust constraint of white empty inside the cell
    CGRect offsetFrame = self.topOffset.frame;
    offsetFrame.size.height = self.view.frame.size.height/7;
    [self.topOffset setFrame:offsetFrame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickedUserProfile:(id)sender {
    UserProfile *currentUser = [DatabaseDAO getCurrentUser];
    UserProfileViewController *vc = [[StoryboardList profileStoryboard] instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
    vc.selectedUser = currentUser;
    [self.frostedViewController hideMenuViewController];
    ((UINavigationController *)self.frostedViewController.contentViewController).viewControllers = @[vc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.optionList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 53;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuOptionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuOptionCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MenuOptionCell" owner:self options:nil] objectAtIndex:0];
    }
    cell.optionImage.image = [UIImage imageNamed:[self.optionImage objectAtIndex:indexPath.row]];
    cell.optionTitle.text = [self.optionList objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.frostedViewController hideMenuViewController];
    
    //based on specification, some will push, while others will replace
    if (indexPath.row == 0) {
        ((UINavigationController *)self.frostedViewController.contentViewController).viewControllers = @[[[StoryboardList mainStoryboard] instantiateViewControllerWithIdentifier:@"HomeViewController"]];
    } else if (indexPath.row == 2) {
        [(UINavigationController *)self.frostedViewController.contentViewController pushViewController:[[StoryboardList activityStoryboard] instantiateViewControllerWithIdentifier:@"UserActivityViewController"] animated:YES];
    } else if (indexPath.row == 4) {
        [(UINavigationController *)self.frostedViewController.contentViewController pushViewController:[[StoryboardList settingStoryboard] instantiateViewControllerWithIdentifier:@"SettingViewController"] animated:YES];
    } else if (indexPath.row == 5) {
        [(UINavigationController *)self.frostedViewController.contentViewController pushViewController:[[StoryboardList testPagesStoryboard] instantiateViewControllerWithIdentifier:@"UserFeedbackViewController"] animated:YES];
    }
}


@end
