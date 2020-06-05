//
//  ActivityNotificationViewController.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-29.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "ActivityNotificationViewController.h"
#import "ActivityNotificationCell.h"
#import "Notification.h"
#import "UIColor+fromHex.h"

@interface ActivityNotificationViewController ()

@end

@implementation ActivityNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"ActivityNotificationCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"ActivityNotificationCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

//subjected to change, format not confirmed
//for better organization on server database
//data structure should have
//subject(s), predefined sets of "event" (can be enum or code), blip type refered
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityNotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityNotificationCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ActivityNotificationCell" owner:self options:nil] objectAtIndex:0];
    }
    NSMutableAttributedString *notificationText = [[NSMutableAttributedString alloc] init];
    NSAttributedString *nameStr = [[NSAttributedString alloc] initWithString:@"@clauiechie" attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#D65E62" alpha:1.0] }];
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@" tagged you on a " attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#747474" alpha:1.0] }];
    NSAttributedString *blipStr = [[NSAttributedString alloc] initWithString:@"business blip" attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#D65E62" alpha:1.0] }];
    [notificationText appendAttributedString:nameStr];
    [notificationText appendAttributedString:str];
    [notificationText appendAttributedString:blipStr];
    [notificationText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Avenir Next" size:14] range:NSMakeRange(0, notificationText.length)];
    
    cell.notificationText.attributedText = notificationText;
    
    return cell;
}

@end
