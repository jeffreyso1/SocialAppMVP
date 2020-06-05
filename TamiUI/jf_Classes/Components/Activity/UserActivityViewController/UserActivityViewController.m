//
//  UserActivityViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-29.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "UserActivityViewController.h"
#import "UserActivityPageViewController.h"
#import "UILabelKerning.h"

@interface UserActivityViewController ()

@property (strong, nonatomic) UserActivityPageViewController *pageController;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *activeTips;
@property (weak, nonatomic) IBOutlet UIImageView *triangleIndicator;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UILabelKerning *infoViewTitle;

@end

@implementation UserActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickedMenu:(id)sender {
    [self.frostedViewController presentMenuViewController];
}

- (IBAction)clickedUserActivity:(UIButton *)sender {
    [self moveTriangleIndicatorToView:sender];
    [self hideViews:self.activeTips excluding:@[[self.view viewWithTag:1]]];
    [self.view viewWithTag:1].hidden = NO;
    [self showInfoViewWithTitle:@"ACTIVITY"];
    [self.pageController transitionToPage:0];
}

- (IBAction)clickedActivityNotification:(UIButton *)sender {
    [self moveTriangleIndicatorToView:sender];
    [self hideViews:self.activeTips excluding:@[[self.view viewWithTag:2]]];
    [self.view viewWithTag:2].hidden = NO;
    [self showInfoViewWithTitle:@"NOTIFICATIONS"];
    [self.pageController transitionToPage:1];
}

- (IBAction)clickedFollowingNotification:(UIButton *)sender {
    [self moveTriangleIndicatorToView:sender];
    [self hideViews:self.activeTips excluding:@[[self.view viewWithTag:4]]];
    [self.view viewWithTag:4].hidden = NO;
    [self showInfoViewWithTitle:@"FOLLOWING"];
    [self.pageController transitionToPage:3];
}

- (void)hideViews:(NSArray *)views excluding:(NSArray *)exclusions {
    for (UIView *view in views) {
        if (![exclusions containsObject:view]) {
            view.hidden = YES;
        }
    }
}

- (void)showViews:(NSArray *)views excluding:(NSArray *)exclusions {
    for (UIView *view in views) {
        if (![exclusions containsObject:view]) {
            view.hidden = NO;
        }
    }
}

- (void)showInfoViewWithTitle:(NSString *)title {
    self.infoViewTitle.text = title;
    [self.infoViewTitle setKerning:1.0];
    self.infoView.hidden = NO;
}

- (void)moveTriangleIndicatorToView:(UIView *)view {
    self.triangleIndicator.hidden = YES;
    CGPoint viewCenter = [view.superview convertPoint:view.center toView:self.view];
    self.triangleIndicator.center = CGPointMake(viewCenter.x, self.triangleIndicator.center.y);
    self.triangleIndicator.hidden = NO;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"EmbedSegue"]) {
        self.pageController = [segue destinationViewController];
    }
}


@end
