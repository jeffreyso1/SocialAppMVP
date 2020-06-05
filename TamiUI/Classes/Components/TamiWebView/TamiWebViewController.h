//
//  TamiWebViewController.h
//  
//
//  Created by Admin on 2016-06-07.
//
//

#import <UIKit/UIKit.h>
#import "UIWebView+AFNetworking.h"
//#import "BlipCellWrapper.h"

@interface TamiWebViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *web_view;
//@property (strong, nonatomic) BlipCellWrapper *data;

- (IBAction)clickClose:(id)sender;
@end
