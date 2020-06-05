//
//  BlipSearchViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-27.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "BlipSearchViewController.h"
#import "BlipPopupCell.h"
#import "TMIServerUtil.h"
#import "TestDataManager.h"
#import "BlipPreview.h"
#import "UIColor+fromHex.h"

@interface BlipSearchViewController ()

@property (weak, nonatomic) IBOutlet UIView *trendingView;
@property (weak, nonatomic) IBOutlet UIView *suggestionView;
@property (weak, nonatomic) IBOutlet UIView *blipListView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet YYLabel *trendingTagList;
@property (weak, nonatomic) IBOutlet YYLabel *suggestionTagList;
@property NSArray *blips;
@property NSArray *trendingTags;

@end

@implementation BlipSearchViewController

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
    
    //TODO get trending tags from server
    self.trendingTags = @[@"These", @"Are", @"Trending", @"Tags", @"From", @"Server"];
    
    //
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self drawTagList:self.trendingTagList tags:self.trendingTags];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//suggest tags when tag is entered, could be server side or client side
- (void)searchTagsWithTag:(NSString *)tag {
    if ([tag isEqualToString:@""]) {
        self.suggestionView.hidden = YES;
    } else {
        self.suggestionView.hidden = NO;
        [self drawTagList:self.suggestionTagList tags:@[@"Blip", @"With", @"Name", tag, @"From", @"Server"]];
    }
}

- (void)searchBlipsWithTag:(NSString *)tag {
    //TODO get blips with tag from server
    self.blipListView.hidden = NO;
    [[TestDataManager sharedInstance] getUserProfileOtherBlips:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (![TMIServerUtil isError:error]) {
            self.blips = [NSArray yy_modelArrayWithClass:[BlipPreview class] json:responseObject];
        }
        [self.collectionView reloadData];
    }];

}

- (void)drawTagList:(YYLabel *)label tags:(NSArray *)tags{
    CGFloat listWidth = CGRectGetWidth(label.frame);
    CGFloat listHeight = CGRectGetHeight(label.frame);
    
    //main attributed text label
    NSMutableAttributedString *tagLabel = [[NSMutableAttributedString alloc] init];
    
    for (NSString *tag in tags) {
        //the tag name
        NSMutableAttributedString *tagString = [[NSMutableAttributedString alloc] initWithString:tag];
        tagString.yy_font = [UIFont fontWithName:@"Avenir Next" size:13];
        tagString.yy_color = [UIColor colorWithHexString:@"#D65E62" alpha:1.0];

        YYTextBorder *border = [YYTextBorder new];
        border.cornerRadius = 8;
        border.insets = UIEdgeInsetsMake(-5, -7, -5, -7);
        border.strokeWidth = 1;
        border.strokeColor = tagString.yy_color;
        border.lineStyle = YYTextLineStyleSingle;
        tagString.yy_textBackgroundBorder = border;
        
        YYTextBorder *highlightBorder = border.copy;
        highlightBorder.strokeWidth = 0;
        highlightBorder.strokeColor = tagString.yy_color;
        highlightBorder.fillColor = tagString.yy_color;
        
        YYTextHighlight *highlight = [YYTextHighlight new];
        [highlight setColor:[UIColor whiteColor]];
        [highlight setBackgroundBorder:highlightBorder];
        highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            NSString *tagName = [text.string substringWithRange:range];
            NSLog(@"Tag: %@", tagName);
            [self searchBlipsWithTag:tagName];
        };
        [tagString yy_setTextHighlight:highlight range:tagString.yy_rangeOfAll];
        
        //padding
        NSMutableAttributedString *padding =
            [[NSMutableAttributedString alloc] initWithString:@"       "];
        padding.yy_font = [UIFont fontWithName:@"Avenir Next" size:13];
        
        //if there is enough space for tagname and padding (> 0), draw. otherwise, exit loop
        if (listWidth - tagString.size.width - padding.size.width <= 20) {
            NSMutableAttributedString *newLine = [[NSMutableAttributedString alloc] initWithString:@"\n\n"];
            newLine.yy_font = [UIFont systemFontOfSize:14];
            
            if (listHeight - newLine.size.height > 0) {
                listHeight = listHeight - newLine.size.height;
                [tagLabel appendAttributedString:newLine];
                listWidth = CGRectGetWidth(label.frame);
            } else {
                break;
            }
        }
        
        [tagLabel appendAttributedString:tagString];
        [tagLabel appendAttributedString:padding];
        listWidth = listWidth - tagString.size.width - padding.size.width;
    }
    label.attributedText = tagLabel;
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

@end
