//
//  GemStoreViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-08-18.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "GemStoreViewController.h"
#import "GemStoreHeaderCell.h"
#import "GemStoreItemCell.h"
#import "GemStoreFooterCell.h"

#import "TMIServerUtil.h"
#import "TestDataManager.h"
#import "GemStoreInfo.h"
#import "GemStoreItem.h"

@interface GemStoreViewController ()

@property (weak, nonatomic) IBOutlet UITableView *gemStoreList;
@property GemStoreInfo *gemStoreInfo;

@end

@implementation GemStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gemStoreInfo = [[GemStoreInfo alloc] init];
    self.gemStoreInfo.storeItems = [[NSArray alloc] init];
    
    [[TestDataManager sharedInstance] getGemStoreInfo:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (![TMIServerUtil isError:error]) {
            self.gemStoreInfo = [GemStoreInfo yy_modelWithJSON:responseObject];
            
            GemStoreHeaderCell *headerCell = [[[NSBundle mainBundle] loadNibNamed:@"GemStoreHeaderCell" owner:self options:nil] objectAtIndex:0];
            [headerCell.profileImage setImageWithURL:[NSURL URLWithString:self.gemStoreInfo.profileImageUrl]];
            headerCell.redGemCount.text = [NSString stringWithFormat:@"%@", self.gemStoreInfo.redGemCount];
            headerCell.blueGemCount.text = [NSString stringWithFormat:@"%@", self.gemStoreInfo.blueGemCount];
            
            self.gemStoreList.tableHeaderView = headerCell;
            self.gemStoreList.tableFooterView = [[[NSBundle mainBundle] loadNibNamed:@"GemStoreFooterCell" owner:self options:nil] objectAtIndex:0];
        }
        [self.gemStoreList reloadData];
    }];
    UINib *nib = [UINib nibWithNibName:@"GemStoreItemCell" bundle:nil];
    [self.gemStoreList  registerNib:nib forCellReuseIdentifier:@"GemStoreItemCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.gemStoreInfo.storeItems.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 105;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GemStoreItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GemStoreItemCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GemStoreItemCell" owner:self options:nil] objectAtIndex:0];
    }
    GemStoreItem *item = [self.gemStoreInfo.storeItems objectAtIndex:indexPath.row];
    cell.itemPrice.text = [NSString stringWithFormat:@"$%0.2f", [item.price doubleValue]];
    if (item.bonus != nil) {
        cell.gemCount.hidden = YES;
        cell.bonusGemCount.text = item.itemName;
        cell.bonusItemInfo.text = [NSString stringWithFormat:@"Bonus: %@", item.bonus];
    } else {
        cell.gemCount.hidden = NO;
        cell.gemCount.text = item.itemName;
        cell.bonusGemCount.hidden = YES;
        cell.bonusItemInfo.hidden = YES;
    }
    
    return cell;
}


@end
