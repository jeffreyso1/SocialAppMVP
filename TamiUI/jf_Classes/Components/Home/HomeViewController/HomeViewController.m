//
//  HomeViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-26.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "HomeViewController.h"
#import "HomePagesViewController.h"
#import "BlipSearchViewController.h"
#import "UILabelKerning.h"
#import "StoryboardList.h"

#define RECOMMENDED_BLIP_TAG @"101"
#define LIKED_BLIP_TAG @"102"
#define SOCIAL_BLIP_TAG @"103"
#define BUSINESS_BLIP_TAG @"104"
#define QUESTION_BLIP_TAG @"105"
#define ARTS_BLIP_TAG @"106"
#define TRAVEL_BLIP_TAG @"107"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *listButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIImageView *addButtonActive;
@property (weak, nonatomic) IBOutlet UIButton *blipSelectionButton;
@property (weak, nonatomic) IBOutlet UIView *blipSelectionView;
@property (weak, nonatomic) IBOutlet UIView *trendSearchView;

@property (weak, nonatomic) NSLayoutConstraint *triangleCenter;
@property (weak, nonatomic) IBOutlet UIImageView *triangleIndicator;

@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UILabelKerning *infoViewTitle;
@property (weak, nonatomic) IBOutlet UIButton *infoViewClose;

@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (strong, nonatomic) HomePagesViewController *pageController;

@property CGPoint buttonDefaultPosition;
@property BOOL isButtonMoved;
@property NSMutableDictionary *blipTypeButtonMap;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blipTypeButtonMap = [[NSMutableDictionary alloc] init];
    [self.blipTypeButtonMap setObject:@"RECOMMENDED" forKey:RECOMMENDED_BLIP_TAG];
    [self.blipTypeButtonMap setObject:@"LIKED" forKey:LIKED_BLIP_TAG];
    [self.blipTypeButtonMap setObject:@"SOCIAL" forKey:SOCIAL_BLIP_TAG];
    [self.blipTypeButtonMap setObject:@"BUSINESS" forKey:BUSINESS_BLIP_TAG];
    [self.blipTypeButtonMap setObject:@"QUESTION" forKey:QUESTION_BLIP_TAG];
    [self.blipTypeButtonMap setObject:@"ARTS" forKey:ARTS_BLIP_TAG];
    [self.blipTypeButtonMap setObject:@"TRAVEL" forKey:TRAVEL_BLIP_TAG];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickedBlipSelection:(UIButton *)sender {
    if (!self.isButtonMoved) {
        self.buttonDefaultPosition = sender.center;
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.blipSelectionButton.center = self.menuButton.center;
                             self.menuButton.hidden = YES;
                             self.searchButton.hidden = YES;
                             self.listButton.hidden = YES;
                             self.addButton.hidden = YES;
                             self.addButtonActive.hidden = YES;
                         } completion:^(BOOL finished) {
                             self.blipSelectionView.hidden = NO;
                             self.isButtonMoved = YES;
                         }];
    } else {
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.blipSelectionButton.center = self.buttonDefaultPosition;
                             self.blipSelectionView.hidden = YES;
                         } completion:^(BOOL finished) {
                             self.menuButton.hidden = NO;
                             self.searchButton.hidden = NO;
                             self.listButton.hidden = NO;
                             self.addButton.hidden = NO;
                             self.addButtonActive.hidden = YES;
                             self.isButtonMoved = NO;
                         }];
    }
    self.infoView.hidden = YES;
    self.triangleIndicator.hidden = YES;
    [self.pageController transitionToPage:0];
}

- (IBAction)clickedMenu:(UIButton *)sender {
    [self.frostedViewController presentMenuViewController];
}

- (IBAction)clickedBlipType:(UIButton *)sender {
    NSInteger tag = sender.tag;
    NSArray *keys = self.blipTypeButtonMap.allKeys;
    for (NSString *key in keys) {
        NSInteger buttonTag = key.integerValue;
        UIButton *button = [self.view viewWithTag:key.integerValue];
        if (buttonTag == tag) {
            button.alpha = 1.0;
        } else {
            button.alpha = 0.6;
        }
    }
    NSString *blipType = [self.blipTypeButtonMap valueForKey:@(tag).stringValue];
    [self moveTriangleIndicatorToView:sender];
    [self showInfoViewWithTitle:blipType showClose:NO];
}

- (IBAction)clickedAdd:(UIButton *)sender {
    self.addButtonActive.hidden = NO;
    [self.pageController transitionToPage:1];
    [self moveTriangleIndicatorToView:sender];
    [self showInfoViewWithTitle:@"NEW BLIP" showClose:YES];
}

- (IBAction)clickedSearch:(UIButton *)sender {
    if (!self.isButtonMoved) {
        self.buttonDefaultPosition = sender.center;
        [UIView animateWithDuration:0.3
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.searchButton.center = self.blipSelectionButton.center;
                             self.menuButton.hidden = YES;
                             self.blipSelectionButton.hidden = YES;
                             self.listButton.hidden = YES;
                             self.addButton.hidden = YES;
                             self.addButtonActive.hidden = YES;
                         } completion:^(BOOL finished) {
                             self.trendSearchView.hidden = NO;
                             self.isButtonMoved = YES;
                         }];
        [self.pageController transitionToPage:2];
    } else {
        [UIView animateWithDuration:0.3
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.searchButton.center = self.buttonDefaultPosition;
                             self.trendSearchView.hidden = YES;
                         } completion:^(BOOL finished) {
                             self.menuButton.hidden = NO;
                             self.blipSelectionButton.hidden = NO;
                             self.listButton.hidden = NO;
                             self.addButton.hidden = NO;
                             self.addButtonActive.hidden = YES;
                             self.isButtonMoved = NO;
                         }];
        [self.pageController transitionToPage:0];
    }
    
    
    self.infoView.hidden = YES;
    self.triangleIndicator.hidden = YES;
}

- (IBAction)clickedInfoClose:(id)sender {
    self.infoView.hidden = YES;
    self.triangleIndicator.hidden = YES;
    self.addButton.hidden = NO;
    self.addButtonActive.hidden = YES;
    [self.pageController transitionToPage:0];
}

- (void)showInfoViewWithTitle:(NSString *)title showClose:(BOOL)showClose {
    self.infoViewTitle.text = title;
    [self.infoViewTitle setKerning:1.0];
    self.infoViewClose.hidden = !showClose;
    self.infoView.hidden = NO;
}

- (void)moveTriangleIndicatorToView:(UIView *)view {
    self.triangleIndicator.hidden = YES;
    CGPoint viewCenter = [view.superview convertPoint:view.center toView:self.view];
    self.triangleIndicator.center = CGPointMake(viewCenter.x, self.triangleIndicator.center.y);
    self.triangleIndicator.hidden = NO;
}

#pragma mark - UITextFieldDelegate
- (IBAction)textFieldChanged:(UITextField *)sender {
    NSLog(@"%@", sender.text);
    if (self.pageController.currentItemIndex == 2) {
        BlipSearchViewController *vc = [self.pageController.viewControllers lastObject];
        [vc searchTagsWithTag:sender.text];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"EmbedSegue"]) {
        self.pageController = [segue destinationViewController];
    }
}

@end
