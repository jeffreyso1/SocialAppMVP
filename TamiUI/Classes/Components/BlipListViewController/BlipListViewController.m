//
//  BlipListViewController.m
//  TamiUI
//
//  Created by Admin on 2016-05-25.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "BlipListViewController.h"
#import "BlipDetailViewController.h"
#import "BlipPagesViewController.h"
#import "BlipPopupCell.h"
#import "BlipDetail.h"
#import "TMIServerUtil.h"
#import "UIColor+fromHex.h"

@interface BlipListViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property BlipDetail *selectedBlip;
@property NSInteger selectedIndex;
@property NSArray *blips;

@property UIImage *testImage;
@property CGFloat testImageAlpha;

@end

@implementation BlipListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(screenWidth, BPUCellHeight);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    [self.collectionView registerClass:[BlipPopupCell class] forCellWithReuseIdentifier:@"BlipPopupCell"];
    [self.collectionView setCollectionViewLayout:flowLayout];
    self.collectionView.backgroundColor=[UIColor colorWithHexString:@"#D65E62" alpha:1.0];
     
    self.blips = [[NSArray alloc] init];
    //self.blips = [[TestDataManager sharedInstance] getArrayOfBlips];
    [TMIServerUtil getTestBlipPageModels:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (![TMIServerUtil isError:error]) {
            self.blips = [NSArray yy_modelArrayWithClass:[BlipDetail class] json:responseObject];
        }
        [self.collectionView reloadData];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.blips.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BlipPopupCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BlipPopupCell" forIndexPath:indexPath];
    BlipDetail *blipContent = [self.blips objectAtIndex:indexPath.row];
    cell.blipBannerImage.image = nil;
    [cell.blipBannerImage setImageWithURL:[NSURL URLWithString:blipContent.imageUrl]];
    //cell.creatorThumbnail
    cell.creatorName.text = blipContent.createdBy;
    cell.heartCount.text = blipContent.likeCount.stringValue;
    cell.commentCount.text = blipContent.commentCount.stringValue;
    //cell.blipContent.text
    //cell.timesAgo.text
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndex = indexPath.row;
    [self performSegueWithIdentifier:@"BlipPagesSegue2" sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"BlipPagesSegue2"]) {
        BlipPagesViewController *vc = [segue destinationViewController];
        vc.blips = self.blips;
        vc.selectedIndex = self.selectedIndex;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (IBAction)clickedClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
