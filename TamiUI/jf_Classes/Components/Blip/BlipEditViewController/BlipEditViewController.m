//
//  BlipEditViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-14.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "BlipEditViewController.h"
#import "MBAutoGrowingTextView.h"
#import "UILabelKerning.h"
#import "UIViewController+MJPopupViewController.h"
#import "UIColor+fromHex.h"

@interface BlipEditViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bannerImage;

@property (weak, nonatomic) IBOutlet MBAutoGrowingTextView *bodyText;
@property (weak, nonatomic) IBOutlet UILabel *bodyTextCount;
@property (weak, nonatomic) IBOutlet UITextField *tags;

@property NSMutableDictionary *buttonMap;

@end

@implementation BlipEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.bannerImage setImageWithURL:[NSURL URLWithString:self.selectedBlip.imageUrl]];
    self.bodyText.text = self.selectedBlip.textContent;
    self.bodyTextCount.text = [NSString stringWithFormat:@"%lu/250", (unsigned long)self.selectedBlip.textContent.length];
    self.tags.text = [[self.selectedBlip.tags valueForKey:@"tagName"] componentsJoinedByString:@", "];
    
    //map for button group
    //topic button and corresponding label with tag from left to right
    //1,2,3,4,5
    //11,22,33,44,55
    self.buttonMap = [[NSMutableDictionary alloc] init];
    [self.buttonMap setObject:@"11" forKey:@"1"];
    [self.buttonMap setObject:@"22" forKey:@"2"];
    [self.buttonMap setObject:@"33" forKey:@"3"];
    [self.buttonMap setObject:@"44" forKey:@"4"];
    [self.buttonMap setObject:@"55" forKey:@"5"];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    [super viewWillDisappear:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickedTopic:(UIButton *)sender {
    NSInteger tag = sender.tag;
    
    //loop through buttons, creates a selection effect by hiding labels and changing alphas
    NSArray *keys = [self.buttonMap allKeys];
    for (NSString *buttonTag in keys) {
        UIButton *topicButton = [self.view viewWithTag:[buttonTag integerValue]];
        UILabel *topicLabel = [self.view viewWithTag:[[self.buttonMap valueForKey:buttonTag] integerValue]];
        
        if (tag == buttonTag.integerValue) {
            topicButton.alpha = 1.0;
            topicLabel.hidden = NO;
        } else {
           topicButton.alpha = 0.6;
            topicLabel.hidden = YES;
        }
    }
}

- (IBAction)clickedDeleteBlip:(id)sender {
    BlipDeletePopupView *view = [[BlipDeletePopupView alloc] initWithNibName:@"BlipDeletePopupView" bundle:nil];
    view.delegate = self;
    [self presentPopupViewController:view animationType:MJPopupViewAnimationFade contentInteraction:MJPopupViewContentInteractionDismissBackgroundOnly];
}

- (IBAction)clickedUpload:(id)sender {
    [self selectPhoto];
}

- (IBAction)clickedClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickedSave:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - BlipDeletePopupView
- (void)didClickedConfirm:(BlipDeletePopupView *)view {
    [self dismissPopupViewController:view animationType:MJPopupViewAnimationFade];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];
    self.bannerImage.image = selectedImage;

    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)selectPhoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#D65E62" alpha:1.0]};
    
    [self presentViewController:picker animated:YES completion:NULL];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"Type Something"]) {
        textView.text = @"";
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"Type Something";
    }
    [textView resignFirstResponder];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    return textView.text.length + (text.length - range.length) <= 250;
}

- (void)textViewDidChange:(UITextView *)textView {
    self.bodyTextCount.text = [NSString stringWithFormat:@"%lu/250", (unsigned long)textView.text.length];
}



@end
