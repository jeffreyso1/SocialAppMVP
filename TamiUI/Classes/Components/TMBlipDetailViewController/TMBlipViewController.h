//
//  TMBlipViewController.h
//  TamiLab
//
//  Created by Admin on 2016-06-17.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMBlipViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *closeButton;
- (IBAction)clickCloseButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
