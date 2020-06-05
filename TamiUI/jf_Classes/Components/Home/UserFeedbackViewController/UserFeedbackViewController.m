//
//  UserFeedbackViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-28.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "UserFeedbackViewController.h"
#import "UIColor+fromHex.h"
#import "GradientView.h"

@interface UserFeedbackViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundBanner;
@property (strong, nonatomic) GradientView *gradientView;

@end

@implementation UserFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Add Gradient
    self.gradientView = [[GradientView alloc] initWithFrame:self.backgroundBanner.bounds];
    self.gradientView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.gradientView.layer.colors = @[(id)[[UIColor colorWithHexString:@"#D65E62" alpha:1.0] CGColor], (id)[[UIColor blackColor] CGColor]];
    self.gradientView.alpha = 0.6;
    //self.gradientView.layer.startPoint = CGPointMake(0.5, 0.25);
    [self.backgroundBanner insertSubview:self.gradientView atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickedBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"Your Message"]) {
        textView.text = @"";
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"Your Message";
    }
    [textView resignFirstResponder];
}

@end
