//
//  UserActivityNotificationController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-08-19.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "UserActivityNotificationController.h"
#import "UserActivityNotificationCell.h"
#import "UIColor+fromHex.h"

@interface UserActivityNotificationController ()

@end

@implementation UserActivityNotificationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"UserActivityNotificationCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"UserActivityNotificationCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserActivityNotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserActivityNotificationCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"UserActivityNotificationCell" owner:self options:nil] objectAtIndex:0];
    }
    NSMutableAttributedString *notificationText = [[NSMutableAttributedString alloc] init];
    NSAttributedString *eventString = [[NSAttributedString alloc] initWithString:@"You commented on a" attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#747474" alpha:1.0] }];
    NSAttributedString *blipString = [[NSAttributedString alloc] initWithString:@" Business Blip" attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#D65E62" alpha:1.0] }];
    [notificationText appendAttributedString:eventString];
    [notificationText appendAttributedString:blipString];
    [notificationText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Avenir Next" size:14] range:NSMakeRange(0, notificationText.length)];
    
    cell.notificationText.attributedText = notificationText;
    
    return cell;
}

@end
