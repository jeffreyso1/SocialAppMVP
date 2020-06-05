//
//  UserProfileEditViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-14.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "UserProfileEditViewController.h"
#import "MBAutoGrowingTextView.h"
#import "DatabaseDAO.h"
#import "UIColor+fromHex.h"

#define UPLOAD_BANNER 1
#define UPLOAD_PROFILE 2

@interface UserProfileEditViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bannerImage;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *profileTagline;
@property (weak, nonatomic) IBOutlet MBAutoGrowingTextView *profileBio;
@property (weak, nonatomic) IBOutlet UITextField *website;
@property (weak, nonatomic) IBOutlet UITextField *userLocation;

@property NSInteger uploadIdentifier;

@end

@implementation UserProfileEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedUser = [DatabaseDAO getCurrentUser];
    
    [self.bannerImage setImageWithURL:[NSURL URLWithString:self.selectedUser.headerImageUrl]];
    [self.profileImage setImageWithURL:[NSURL URLWithString:self.selectedUser.profilePhotoUrl]];
    self.username.text = self.selectedUser.name;
    //optional fields
    self.profileTagline.text = self.selectedUser.profileTagline ? self.selectedUser.profileTagline : @"";
    self.profileBio.text =  self.selectedUser.profileBio ? self.selectedUser.profileBio : @"";
    self.userLocation.text = self.selectedUser.location ? self.selectedUser.location : @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)clickedBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickedSave:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickedUploadBanner:(id)sender {
    self.uploadIdentifier = UPLOAD_BANNER;
    [self selectPhoto];
}

- (IBAction)clickedUploadProfile:(id)sender {
    self.uploadIdentifier = UPLOAD_PROFILE;
    [self selectPhoto];
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

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];
    if (self.uploadIdentifier == UPLOAD_BANNER) {
        self.bannerImage.image = selectedImage;
    } else if (self.uploadIdentifier == UPLOAD_PROFILE) {
        self.profileImage.image = selectedImage;
    }
    
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

@end
