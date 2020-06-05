//
//  BlipDetailViewController.m
//  Tami
//
//  Created by Roman Mironenko on 2016-06-29.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import "BlipDetailViewController.h"
#import "BlipEditViewController.h"
#import "BlipCommentCell.h"

#import "UserProfileViewController.h"

#import "PhotoViewable.h"
#import "UIColor+fromHex.h"
#import "GradientView.h"

#import "DatabaseDAO.h"
#import "UserProfile.h"
#import "TestDataManager.h"
#import "StoryboardList.h"

#import "UIViewController+MJPopupViewController.h"

@interface BlipDetailViewController ()
@property (strong, nonatomic) GradientView *gradientView;
@property (weak, nonatomic) IBOutlet UIView *blipBannerView;
@property (weak, nonatomic) IBOutlet UIImageView *blipBannerImage;
@property (weak, nonatomic) IBOutlet UIButton *creatorProfileIcon;
@property (weak, nonatomic) IBOutlet UILabel *creatorProfileName;
@property (weak, nonatomic) IBOutlet UITextView *blipBody;

@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;
@property (weak, nonatomic) IBOutlet YYLabel *tagList;

@property (weak, nonatomic) IBOutlet UITableView *commentListView;
@property (weak, nonatomic) IBOutlet UITextField *commentInput;
@property (weak, nonatomic) IBOutlet UIView *commentTextView;

@property (weak, nonatomic) IBOutlet UIView *commentButtonView;

@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end

@implementation BlipDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UserProfile *userInfo = [DatabaseDAO getCurrentUser];
    if ([userInfo.name isEqualToString:self.selectedBlip.createdBy]) {
        self.likeButton.hidden = YES;
        self.editButton.hidden = NO;
    }
    
    //Add Gradient
    self.gradientView = [[GradientView alloc] initWithFrame:self.blipBannerView.bounds];
    self.gradientView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.gradientView.layer.colors = @[(id)[[UIColor whiteColor] CGColor], (id)[[UIColor blackColor] CGColor]];
    //self.gradientView.layer.startPoint = CGPointMake(0.5, 0.25);
    [self.blipBannerView insertSubview:self.gradientView atIndex:0];
    
    //setting ui
    [self.blipBannerImage setImageWithURL:[NSURL URLWithString:self.selectedBlip.imageUrl]];
    //self.creatorProfileIcon
    [self.creatorProfileIcon addTarget:self action:@selector(clickedCommenterIcon:) forControlEvents:UIControlEventTouchUpInside];
    self.creatorProfileName.text = self.selectedBlip.createdBy;
    //self.blipBody.text =
    
    self.likeCount.text = self.selectedBlip.likeCount.stringValue;
    self.commentCount.text = self.selectedBlip.commentCount.stringValue;
    
    //Add padding on comment TextField
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 20)];
    self.commentInput.rightView = paddingView;
    self.commentInput.rightViewMode = UITextFieldViewModeAlways;
    
    UINib *nib = [UINib nibWithNibName:@"BlipCommentCell" bundle:nil];
    [self.commentListView registerNib:nib forCellReuseIdentifier:@"BlipCommentCell"];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
    [self drawTagList];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    [super viewWillDisappear:animated];
}

- (void)viewDidLayoutSubviews {
    self.blipBody.contentOffset = CGPointZero;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//tag list is a single label of attributed clickable string
- (void)drawTagList {
    //Get the width of the frame AFTER it is drawn with the corresponding constraint
    //used to calculate how many px of space is remaining
    CGFloat listWidth = CGRectGetWidth(self.tagList.frame);
    
    //2 things will always appear, the left padding, and ... at the end
    //the space avalible for tags is whatever is left after they are deducted
    NSMutableAttributedString *leftPadding = [[NSMutableAttributedString alloc] initWithString:@" "];
    NSMutableAttributedString *showMore = [[NSMutableAttributedString alloc] initWithString:@"..."];
    showMore.yy_font = [UIFont systemFontOfSize:20];
    [showMore yy_setTextHighlightRange:showMore.yy_rangeOfAll
                                  color:[UIColor colorWithHexString:@"#D65E62" alpha:1.0]
                        backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                              tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
                                  [self showFullTagList];
                              }];
    listWidth = listWidth - showMore.size.width - leftPadding.size.width;
    
    //main attributed text label
    NSMutableAttributedString *tagLabel = [[NSMutableAttributedString alloc] init];
    [tagLabel appendAttributedString:leftPadding];
    
    for (BlipTag *tag in self.selectedBlip.tags) {
        //the tag name
        NSMutableAttributedString *tagString = [[NSMutableAttributedString alloc] initWithString:tag.tagName];
        tagString.yy_font = [UIFont fontWithName:@"Avenir Next" size:14];
        [tagString yy_setTextHighlightRange:tagString.yy_rangeOfAll
                                      color:[UIColor colorWithHexString:@"#D65E62" alpha:1.0]
                            backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                                  tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
                                      NSLog(@"%@", [text string]);
                                  }];
        //padding
        NSMutableAttributedString *padding = [[NSMutableAttributedString alloc] initWithString:@"    "];
        padding.yy_font = [UIFont fontWithName:@"Avenir Next" size:14];
        
        //if there is enough space for tagname and padding (> 0), draw. otherwise, exit loop
        if (listWidth - tagString.size.width - padding.size.width > 0) {
            [tagLabel appendAttributedString:tagString];
            [tagLabel appendAttributedString:padding];
            listWidth = listWidth - tagString.size.width - padding.size.width;
        } else {
            break;
        }
    }
    [tagLabel appendAttributedString:showMore];
    self.tagList.attributedText = tagLabel;
}

- (void)showFullTagList {
    BlipListPopupView *view = [[BlipListPopupView alloc] initWithNibName:@"BlipListPopupView" bundle:nil];
    view.blipTags = self.selectedBlip.tags;
    view.delegate = self;
    [self presentPopupViewController:view animationType:MJPopupViewAnimationFade contentInteraction:MJPopupViewContentInteractionDismissBackgroundOnly];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.selectedBlip.comments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BlipCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlipCommentCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BlipCommentCell" owner:self options:nil] objectAtIndex:0];
    }
    BlipComment *blipComment = [self.selectedBlip.comments objectAtIndex:indexPath.row];
    //customize cell
    //[cell.commenterIcon.imageView setImageWithURL:]
    //[cell.commenterIcon addTarget:self action:@selector(clickedCommenterIcon:) forControlEvents:UIControlEventTouchUpInside];
    cell.commentedBy.text = blipComment.commentBy;
    cell.commentText.text = blipComment.commentText;
    NSDate *commentDate = [NSDate dateWithString:blipComment.commentDateTime formatString:@"yyyy-MM-dd hh:mmaa"];
    cell.timesAgo.text = [commentDate timeAgoSinceNow];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95;
}

//note: incomplete data
//we can fetch complete profile data by name BEFORE/AFTER page transition on production
- (void)clickedCommenterIcon:(id)sender {
    [[TestDataManager sharedInstance] getUserProfileSelf:^(NSURLResponse *response, id responseObject, NSError *error) {
        UserProfileViewController *vc = [[StoryboardList profileStoryboard] instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
        vc.selectedUser = [UserProfile yy_modelWithJSON:responseObject];
        [self presentViewController:vc animated:YES completion:nil];
    }];
    /*[[TestDataManager sharedInstance] getUserProfileOther:^(NSURLResponse *response, id responseObject, NSError *error) {
        UserProfileViewController *vc = [[StoryboardList profileStoryboard] instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
        vc.selectedUser = [UserProfile yy_modelWithJSON:responseObject];
        [self presentViewController:vc animated:YES completion:nil];
    }];*/
}

- (IBAction)clickedBannerImage:(id)sender {
    PhotoViewable *photo = [[PhotoViewable alloc] init];
    photo.image = self.blipBannerImage.image;
    NYTPhotosViewController *photosViewController = [[NYTPhotosViewController alloc] initWithPhotos:@[photo]];
    [self presentViewController:photosViewController animated:YES completion:nil];
}

- (IBAction)clickedEdit:(id)sender {
    BlipEditViewController *vc = [[StoryboardList blipStoryboard] instantiateViewControllerWithIdentifier:@"BlipEditViewController"];
    vc.selectedBlip = self.selectedBlip;
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)clickedLeaveComment:(id)sender {
    self.commentTextView.hidden = NO;
    self.commentButtonView.hidden = YES;
}

- (IBAction)clickedClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
