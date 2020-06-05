//
//  BlipListPopupView.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-19.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "BlipListPopupView.h"
#import "BlipTagCell.h"
#import "BlipTag.h"

#import "UIViewController+MJPopupViewController.h"

@interface BlipListPopupView ()

@property (weak, nonatomic) IBOutlet UITableView *blipList;

@end

@implementation BlipListPopupView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"BlipTagCell" bundle:nil];
    [self.blipList registerNib:nib forCellReuseIdentifier:@"BlipTagCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.blipTags.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BlipTagCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlipTagCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BlipTagCell" owner:self options:nil] objectAtIndex:0];
    }
    BlipTag *tag = [self.blipTags objectAtIndex:indexPath.row];
    cell.tagName.text = tag.tagName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BlipTag *tag = [self.blipTags objectAtIndex:indexPath.row];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedTagWithName:)]) {
        [self.delegate didSelectedTagWithName:tag.tagName];
    }
    [self dismissPopupViewController:self animationType:MJPopupViewAnimationFade];
}

@end
