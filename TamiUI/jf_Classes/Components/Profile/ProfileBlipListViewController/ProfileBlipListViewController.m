//
//  ProfileBlipListViewController.m
//  TamiUI
//
//  Created by Jeffrey So on 2016-07-17.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "ProfileBlipListViewController.h"
#import "BlipPagesViewController.h"
#import "BlipPopupCell.h"

#import "UserProfile.h"

#import "TMIServerUtil.h"
#import "DatabaseDAO.h"
#import "TestDataManager.h"
#import "StoryboardList.h"
#import "UIColor+fromHex.h"

@interface ProfileBlipListViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSInteger selectedIndex;
@property NSArray *blips;

@end

@implementation ProfileBlipListViewController

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
    
    self.blips = [[NSArray alloc] init];
    
    //get blips
    //for testing purpose only. on production, recommend getting blips by id or name in self.selectedUser
    UserProfile *userInfo = [DatabaseDAO getCurrentUser];
    if ([userInfo.name isEqualToString:self.selectedUser.name]) {
        [[TestDataManager sharedInstance] getUserProfileSelfBlips:^(NSURLResponse *response, id responseObject, NSError *error) {
            if (![TMIServerUtil isError:error]) {
                self.blips = [NSArray yy_modelArrayWithClass:[BlipPreview class] json:responseObject];
            }
            [self.collectionView reloadData];
        }];
    } else {
        [[TestDataManager sharedInstance] getUserProfileOtherBlips:^(NSURLResponse *response, id responseObject, NSError *error) {
            if (![TMIServerUtil isError:error]) {
                self.blips = [NSArray yy_modelArrayWithClass:[BlipPreview class] json:responseObject];
            }
            [self.collectionView reloadData];
        }];
    }
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
    BlipPreview *blipContent = [self.blips objectAtIndex:indexPath.row];
    cell.blipBannerImage.image = nil;
    [cell.blipBannerImage setImageWithURL:[NSURL URLWithString:blipContent.imageUrl]];
    //cell.creatorThumbnail
    cell.creatorName.text = blipContent.createdBy;
    cell.heartCount.text = blipContent.likeCount.stringValue;
    cell.commentCount.text = blipContent.commentCount.stringValue;
    cell.blipBody.text = blipContent.textContent;
    cell.timesAgo.text = @"";
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    /*self.selectedIndex = indexPath.row;
    BlipPagesViewController *vc = [[StoryboardList testPagesStoryboard] instantiateViewControllerWithIdentifier:@"BlipPagesViewController"];
    vc.blips = self.blips;
    vc.selectedIndex = self.selectedIndex;
    [self presentViewController:vc animated:YES completion:nil];*/
    //not the same json format
}


@end
