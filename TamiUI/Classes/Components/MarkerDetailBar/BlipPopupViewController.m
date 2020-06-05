//
//  BlipPopupViewController.m
//  TamiUI
//
//  Created by Admin on 2016-06-25.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "BlipPopupViewController.h"
#import "TMBlipViewController.h"

@interface BlipPopupViewController ()

@end

@implementation BlipPopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    float y=self.view.bounds.size.height/2-30;
//    CGRect headImageFrame=[_headImage frame];
//    headImageFrame=CGRectMake(0, y, 60, 60);
//    [_headImage setFrame:headImageFrame];
//    [self.view layoutIfNeeded];
    
//    UIPanGestureRecognizer * userPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(UserPannedMap:)];
//    userPanGesture.delegate = self;
//    [mapView addGestureRecognizer:userPanGesture];
    UITapGestureRecognizer *userTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGensture:)];
    [userTapGesture setDelegate:self];
    [self.view addGestureRecognizer:userTapGesture];
    
    //marker detail bar initialization
//    UIPanGestureRecognizer * panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragMarkerDetailsBarEvents:)];
//    [panRecognizer setMinimumNumberOfTouches:1];
//    [panRecognizer setMaximumNumberOfTouches:1];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)handleTapGensture:(UITapGestureRecognizer *)gesture {
    //    NSLog(@"map tapped, hide the bottom bar");
//    [self CleanSelectedMarkers];
//    [[Helper sharedInstance] stopSpeak];
    //[[NSNotificationCenter defaultCenter] sdpostNotificationName:@"RemoveMarkerDetailViewController" object:nil];
    TMBlipViewController *blipDetailView=[[TMBlipViewController alloc]init];
    UIView* subView=blipDetailView.view;
    [self.view addSubview:subView];
    [UIView animateWithDuration:0.2 animations:^{
        blipDetailView.view.alpha = 0;
//        blipDetailViewBottom.constant = [UIScreen mainScreen].bounds.size.height;
//        blipDetailViewTop.constant = [UIScreen mainScreen].bounds.size.height;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self.view sendSubviewToBack:blipDetailView.view];
    }];
//    [_searchDestination resignFirstResponder];
    
//    UIImage * image = [[UIImage imageNamed:@"tami_logo_spinner.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [_buttonTami setImage:image forState:UIControlStateNormal];
//    [UIView animateWithDuration:0.2 animations:^{
//        layerPicker.view.alpha = 0;
//        _buttonFollowMe.alpha = 1;
//        _buttonMyPlaces.alpha = 1;
//        layerPicker.view.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 70);
//        [_buttonTami setAlpha:1];
//    }];
}

@end
