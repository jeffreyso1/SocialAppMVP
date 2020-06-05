//
//  NotificationSettingViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-21.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "NotificationSettingViewController.h"
#import "NotificationOptionHeaderCell.h"
#import "NotificationOptionCell.h"

@interface NotificationSettingViewController ()

@property (weak, nonatomic) IBOutlet UITableView *settingList;
@property NSArray *sectionTitle;
@property NSArray *notificationOptions;

@end

@implementation NotificationSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat dummyViewHeight = 65;
    UIView *dummyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.settingList.bounds.size.width, dummyViewHeight)];
    self.settingList.tableHeaderView = dummyView;
    self.settingList.contentInset = UIEdgeInsetsMake(-dummyViewHeight, 0, 0, 0);
    
    self.sectionTitle = @[@"Global", @"Activity"];
    self.notificationOptions = @[@[@"Push Notification", @"Vibration", @"Sound"], @[@"Likes on your Blip", @"Comments on your Blip", @"Tags and mentions", @"New followers", @"Comment after yours", @"Updates from Blips you favourited", @"New Blips by users you follow", @"Private messages"]];
    
    UINib *nib = [UINib nibWithNibName:@"NotificationOptionHeaderCell" bundle:nil];
    [[self settingList] registerNib:nib forCellReuseIdentifier:@"NotificationOptionHeaderCell"];
    UINib *nib2 = [UINib nibWithNibName:@"NotificationOptionCell" bundle:nil];
    [[self settingList] registerNib:nib2 forCellReuseIdentifier:@"NotificationOptionCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickedBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.notificationOptions count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 65;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NotificationOptionHeaderCell *headerCell = [tableView dequeueReusableCellWithIdentifier:@"NotificationOptionHeaderCell"];
    headerCell.sectionTitle.text = [self.sectionTitle objectAtIndex:section];
    return headerCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.notificationOptions objectAtIndex:section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NotificationOptionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotificationOptionCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NotificationOptionCell" owner:self options:nil] objectAtIndex:0];
    }
    cell.optionTitle.text = [[self.notificationOptions objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    return cell;
}

@end
