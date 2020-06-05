//
//  TamiWebViewController.m
//
//
//  Created by Admin on 2016-06-07.
//
//

#import "TamiWebViewController.h"
#import "UIWebView+AFNetworking.h"

@interface TamiWebViewController ()

@end

@implementation TamiWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *urlString = @"file:///Users/Charles1/Downloads/html5up-alpha/index.html#";
//    if (self.data) {
//        urlString=self.data.iconName;
//    }
    
//    NSString* secretAgent = [self.web_view stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
//     self.textUserAgent.text=secretAgent;
//    [[NSUserDefaults standardUserDefaults]registerDefaults:@{@"UserAgent": @"Custom-Agent"}]
//    ;
    self.web_view.frame = CGRectMake(8, 0, [UIScreen mainScreen].bounds.size.width - 16, 600);
    self.web_view.scalesPageToFit=YES;
    self.web_view.scrollView.showsHorizontalScrollIndicator = NO;
    self.web_view.scrollView.showsVerticalScrollIndicator = YES;
    self.web_view.scrollView.scrollEnabled = YES;
    self.web_view.scrollView.scrollsToTop = YES;
    self.web_view.backgroundColor = [UIColor clearColor];
    [self.web_view setOpaque:NO];
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//    
    NSMutableURLRequest * request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request setValue:@"text/html,charset=UTF-8" forHTTPHeaderField:@"Content-Type"];

    //        webView.hidden=NO;
    //            self.tableView.hidden=YES;
    [self.web_view loadRequest:request];
    //        [self.web_view loadHTMLString:<#(nonnull NSString *)#> baseURL:<#(nullable NSURL *)#>]
    //        [self.view addSubview:self.web_view];
    //        [self.view bringSubviewToFront:self.web_view];
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

- (IBAction)clickClose:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
