//
//  BlipCreationViewController.m
//  Tami
//
//  Created by Roman Mironenko on 2016-07-01.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import "BlipCreationViewController.h"
#import "UIColor+fromHex.h"

@interface BlipCreationViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageBanner;
@property (weak, nonatomic) IBOutlet UIButton *imageBannerButton;
@property (weak, nonatomic) IBOutlet UIView *defaultImageBanner;
@property (weak, nonatomic) IBOutlet MBAutoGrowingTextView *bodyText;
@property (weak, nonatomic) IBOutlet UILabel *bodyTextCount;

@property NSMutableDictionary *buttonMap;

@end

@implementation BlipCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //map for button group
    //topic button and corresponding label with tag from left to right
    //1,2,3,4,5
    //11,12,13,14,15
    self.buttonMap = [[NSMutableDictionary alloc] init];
    [self.buttonMap setObject:@"11" forKey:@"1"];
    [self.buttonMap setObject:@"12" forKey:@"2"];
    [self.buttonMap setObject:@"13" forKey:@"3"];
    [self.buttonMap setObject:@"14" forKey:@"4"];
    [self.buttonMap setObject:@"15" forKey:@"5"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickedUpload:(id)sender {
    [self selectPhoto];
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

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];
    self.imageBanner.image = selectedImage;
    self.imageBannerButton.hidden = NO;
    self.defaultImageBanner.hidden = YES;
    
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
