//
//  TMBlipViewController.m
//  TamiLab
//
//  Created by Admin on 2016-06-17.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "TMBlipViewController.h"
#import "MHFacebookImageViewer.h"
#import "UIImageView+MHFacebookImageViewer.h"

@interface TMBlipViewController ()
- (void) displayImage:(UIImageView*)imageView withImage:(UIImage*)image;
@end

@implementation TMBlipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    UITapGestureRecognizer *singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapping:)];
//    [singleTap setNumberOfTapsRequired:1];
//    [self.imageView addGestureRecognizer:singleTap];
    [self displayImage:self.imageView withImage:[UIImage imageNamed:@"SplitShire-9892-1.jpg"]];
    
}
-(void)singleTapping:(UIGestureRecognizer *)recognizer {
    NSLog(@"image clicked");
}
//- (id)initWithCoder:(NSCoder *)aDecoder {
//    if ((self = [super initWithCoder:aDecoder])) {
//        [self.view addSubview:[[[NSBundle mainBundle] loadNibNamed:@"TMBlipViewController" owner:self options:nil] objectAtIndex:0]];
//    }
//    return self;
//}
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


- (IBAction)clickCloseButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) displayImage:(UIImageView*)imageView withImage:(UIImage*)image  {
    [imageView setImage:image];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [imageView setupImageViewer];
    imageView.clipsToBounds = YES;
}

@end
