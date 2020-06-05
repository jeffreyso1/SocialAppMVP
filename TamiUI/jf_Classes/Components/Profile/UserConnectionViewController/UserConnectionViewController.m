//
//  UserConnectionViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-28.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "UserConnectionViewController.h"
#import "UserFollowerViewController.h"
#import "UserFollowingViewController.h"
#import "UILabelKerning.h"

#define FOLLOWERS_BUTTON_TAG @"1"
#define FOLLOWERS_ACTIVE_TAG @"101"
#define FOLLOWING_BUTTON_TAG @"2"
#define FOLLOWING_ACTIVE_TAG @"102"

@interface UserConnectionViewController ()

@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UIView *searchButtonAnchor;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UILabelKerning *infoViewTitle;
@property (weak, nonatomic) IBOutlet UIView *searchBar;

@property (weak, nonatomic) IBOutlet UIImageView *triangleIndicator;
@property (strong, nonatomic) UserConnectionPageViewController *pageController;

@property NSMutableDictionary *barButtonGroup;
@property CGPoint buttonDefaultPosition;
@property BOOL isButtonMoved;

@end

@implementation UserConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barButtonGroup = [[NSMutableDictionary alloc] init];
    [self.barButtonGroup setObject:FOLLOWERS_ACTIVE_TAG forKey:FOLLOWERS_BUTTON_TAG];
    [self.barButtonGroup setObject:FOLLOWING_ACTIVE_TAG forKey:FOLLOWING_BUTTON_TAG];
    
    [self showPage:0];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.isButtonMoved = NO;
    self.buttonDefaultPosition = self.searchButton.center;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickedBarButton:(UIButton *)sender {
    NSInteger tag = sender.tag;
    
    NSArray *keys = [self.barButtonGroup allKeys];
    for (NSString *key in keys) {
        UIImageView *activeImage = [self.view viewWithTag:[[self.barButtonGroup valueForKey:key] integerValue]];
        activeImage.hidden = YES;
    }
    
    [self showPage:(tag-1)];
}

- (IBAction)clickedSearch:(UIButton *)sender {
    if (!self.isButtonMoved) {
        [self toggleSearchBar:YES];
    } else {
        [self toggleSearchBar:NO];
    }
}

- (IBAction)clickedBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showPage:(NSInteger)itemIndex {
    [self moveTriangleIndicatorToView:[self.view viewWithTag:itemIndex+1]];
    [self.view viewWithTag:[[self.barButtonGroup valueForKey:[NSString stringWithFormat:@"%d", itemIndex+1]] integerValue]].hidden = NO;
    [self.pageController transitionToPage:itemIndex];
}

- (void)toggleSearchBar:(BOOL)enable {
    [self.view endEditing:YES];
    self.searchField.text = @"";
    if (enable) {
        self.buttonDefaultPosition = self.searchButton.center;
        self.infoViewTitle.hidden = YES;
        [UIView animateWithDuration:0.3
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.searchButton.center = self.searchButtonAnchor.center;
                         } completion:^(BOOL finished) {
                             self.searchBar.hidden = NO;
                             self.isButtonMoved = YES;
                         }];
    } else {
        self.infoViewTitle.hidden = NO;
        [UIView animateWithDuration:0.3
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.searchButton.center = self.buttonDefaultPosition;
                             self.searchBar.hidden = YES;
                         } completion:^(BOOL finished) {
                             self.isButtonMoved = NO;
                         }];
    }
}

- (void)updateBarTitle:(NSString *)title {
    self.infoViewTitle.text = title;
    [self.infoViewTitle setKerning:1.0];
    [self toggleSearchBar:NO];
}

- (void)moveTriangleIndicatorToView:(UIView *)view {
    self.triangleIndicator.hidden = YES;
    CGPoint viewCenter = [view.superview convertPoint:view.center toView:self.view];
    self.triangleIndicator.center = CGPointMake(viewCenter.x, self.triangleIndicator.center.y);
    self.triangleIndicator.hidden = NO;
}

#pragma mark - UITextFieldDelegate

- (IBAction)textFieldChanged:(UITextField *)sender {
    if (self.pageController.currentItemIndex == 0) {
        UserFollowerViewController *vc = [self.pageController.viewControllers lastObject];
        [vc searchFollowerWithName:sender.text];
    } else if (self.pageController.currentItemIndex == 1) {
        UserFollowingViewController *vc = [self.pageController.viewControllers lastObject];
        [vc searchFollowingWithName:sender.text];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"EmbedSegue"]) {
        self.pageController = [segue destinationViewController];
        self.pageController.pageDelegate = self;
    }
}

@end
