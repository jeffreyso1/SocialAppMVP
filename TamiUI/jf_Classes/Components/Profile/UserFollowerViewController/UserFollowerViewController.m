//
//  UserFollowerViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-28.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "UserFollowerViewController.h"
#import "UserFollowerCell.h"
#import "TestDataManager.h"
#import "TMIServerUtil.h"
#import "UserFollower.h"

@interface UserFollowerViewController ()

@property NSArray *filteredFollowerList;

@end

@implementation UserFollowerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.followerList = [[NSArray alloc] init];
    self.filteredFollowerList = [[NSArray alloc] init];
    [[TestDataManager sharedInstance] getTestFollower:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (![TMIServerUtil isError:error]) {
            self.followerList = [NSArray yy_modelArrayWithClass:[UserFollower class] json:responseObject];
            self.filteredFollowerList = [self.followerList copy];
            
            if (self.pageDelegate && [self.pageDelegate respondsToSelector:@selector(didFinishFetchingFollowers:)]) {
                [self.pageDelegate didFinishFetchingFollowers:[NSString stringWithFormat:@"%lu FOLLOWERS", (unsigned long)self.followerList.count]];
            }
        }
        [self.tableView reloadData];
    }];
    
    UINib *nib = [UINib nibWithNibName:@"UserFollowerCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"UserFollowerCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)searchFollowerWithName:(NSString *)name {
    if (![name isEqualToString:@""]) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name CONTAINS[cd] %@", name];
        self.filteredFollowerList = [self.followerList filteredArrayUsingPredicate:predicate];
    } else {
        self.filteredFollowerList = self.followerList;
    }
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filteredFollowerList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserFollowerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserFollowerCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"UserFollowerCell" owner:self options:nil] objectAtIndex:0];
    }
    UserFollower *user = [self.filteredFollowerList objectAtIndex:indexPath.row];
    [cell.userThumbnail setImageWithURL:[NSURL URLWithString:user.profilePhotoUrl]];
    cell.userName.text = user.name;
    cell.userSubtitle.text = user.profileTagline;
    cell.followButton.selected = user.isFollowing;
    
    return cell;
}

@end
