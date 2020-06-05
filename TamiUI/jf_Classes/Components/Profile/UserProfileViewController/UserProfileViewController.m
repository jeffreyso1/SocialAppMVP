//
//  UserProfileViewController.m
//  TamiUI
//
//  Created by Admin on 2016-06-21.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "UserProfileViewController.h"
#import "UserProfileEditViewController.h"
#import "ProfileBlipPagesViewController.h"

#import "DatabaseDAO.h"
#import "StoryboardList.h"
#import "TestDataManager.h"
#import "UIColor+fromHex.h"

@interface UserProfileViewController ()

@property (weak, nonatomic) ProfileBlipPagesViewController *vc;

@property NSMutableDictionary *barButtonMap;
@property NSInteger currentIndex;

@property (weak, nonatomic) IBOutlet UIButton *addFriendButton;
@property (weak, nonatomic) IBOutlet UIButton *mailButton;
@property (weak, nonatomic) IBOutlet UIButton *settingButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@property (weak, nonatomic) IBOutlet UIImageView *userBanner;
@property (weak, nonatomic) IBOutlet UIImageView *userProfile;
@property (weak, nonatomic) IBOutlet UILabel *followerCount;
@property (weak, nonatomic) IBOutlet UILabel *blipCount;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *profileTagline;
@property (weak, nonatomic) IBOutlet UILabel *profileBio;
@property (weak, nonatomic) IBOutlet UILabel *userLocation;
@property (weak, nonatomic) IBOutlet UIButton *gemCount;

@end

@implementation UserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //a map of button (without kernings) and corresponding label with kernings of "selected" color
    self.barButtonMap = [[NSMutableDictionary alloc] init];
    [self.barButtonMap setObject:@"11" forKey:@"1"];
    [self.barButtonMap setObject:@"22" forKey:@"2"];
    [self.barButtonMap setObject:@"33" forKey:@"3"];

    //apply kerning to buttons
    NSArray *keys = [self.barButtonMap allKeys];
    for (NSString *buttonTag in keys) {
        UIButton *barButton = [self.view viewWithTag:[buttonTag integerValue]];
        [barButton setAttributedTitle:[[NSMutableAttributedString alloc] initWithString:barButton.titleLabel.text attributes:@{NSKernAttributeName : @1.0}] forState:UIControlStateNormal];
    }
    [self.view viewWithTag:1].hidden = YES;
    [self.view viewWithTag:11].hidden = NO;
    self.currentIndex = 0;
    
    //hide or show buttons depending on whether this is self user profile
    UserProfile *currentUser = [DatabaseDAO getCurrentUser];
    if ([self.selectedUser.name isEqualToString:currentUser.name]) {
        self.addFriendButton.hidden = YES;
        self.mailButton.hidden = YES;
        self.settingButton.hidden = NO;
        self.editButton.hidden = NO;
    } else {
        self.addFriendButton.hidden = NO;
        self.mailButton.hidden = NO;
        self.settingButton.hidden = YES;
        self.editButton.hidden = YES;
    }
    
    [self.userBanner setImageWithURL:[NSURL URLWithString:self.selectedUser.headerImageUrl]];
    [self.userProfile setImageWithURL:[NSURL URLWithString:self.selectedUser.profilePhotoUrl]];
    self.followerCount.text = self.selectedUser.followerCount.stringValue;
    self.blipCount.text = self.selectedUser.blipCount.stringValue;
    self.username.text = self.selectedUser.name;
    self.profileTagline.text = self.selectedUser.profileTagline ? self.selectedUser.profileTagline : @"";
    self.profileBio.text =  self.selectedUser.profileBio ? self.selectedUser.profileBio : @"";
    self.userLocation.text = self.selectedUser.location ? self.selectedUser.location : @"";
    [self.gemCount setTitle:self.selectedUser.gemCount.stringValue forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)clickedMenu:(id)sender {
    [self.frostedViewController presentMenuViewController];
}

- (IBAction)clickedEdit:(id)sender {
    [(UINavigationController *)self.frostedViewController.contentViewController pushViewController:[[StoryboardList settingStoryboard] instantiateViewControllerWithIdentifier:@"UserProfileEditViewController"] animated:YES];
}

- (IBAction)clickedBarButton:(UIButton *)sender {
    NSInteger tag = sender.tag;
    [self highlighButtonWithTag:tag];
    
    //transition to view with correct direction animation
    //does not do anything if clicking on an already "selected" page
    if (self.currentIndex != tag-1) {
        NSArray *startingViewControllers = @[[self.vc itemControllerForIndex:tag-1]];
        if (self.currentIndex > tag-1) {
            [self.vc setViewControllers:startingViewControllers
                              direction:UIPageViewControllerNavigationDirectionReverse
                               animated:YES
                             completion:nil];
        } else {
            [self.vc setViewControllers:startingViewControllers
                              direction:UIPageViewControllerNavigationDirectionForward
                               animated:YES
                             completion:nil];
        }
        self.currentIndex = tag-1;
    }
}

#pragma mark - ProfileBlipPagesDelegate

- (void)pageWillTransitionToIndex:(NSInteger)newIndex {
    self.currentIndex = newIndex;
    [self highlighButtonWithTag:newIndex+1];
}

//Tag has to start at 1(ui without tag defaults to 0), while index should start at 0
//"highlight" the selected button and unhighlight everything else
//reason for hiding button with "unselected" color and showing label with "selected" color (and reverse)
//is because changing button attributed string will make them "flash" for a split second due to uibutton implementation
- (void)highlighButtonWithTag:(NSInteger)tag {
    NSArray *keys = [self.barButtonMap allKeys];
    for (NSString *buttonTag in keys) {
        UIButton *barButton = [self.view viewWithTag:[buttonTag integerValue]];
        UILabel *selectedLabel = [self.view viewWithTag:[[self.barButtonMap valueForKey:buttonTag] integerValue]];
        if (buttonTag.integerValue == tag) {
            barButton.hidden = YES;
            selectedLabel.hidden = NO;
        } else {
            barButton.hidden = NO;
            selectedLabel.hidden = YES;
        }
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"EmbedSegue"]) {
        self.vc = [segue destinationViewController];
        self.vc.selectedUser = self.selectedUser;
        self.vc.pageDelegate = self;
    } else if ([[segue identifier] isEqualToString:@"UserProfileEditSegue"]) {
        UserProfileEditViewController *vc = [segue destinationViewController];
        vc.selectedUser = self.selectedUser;
    }
}


@end
