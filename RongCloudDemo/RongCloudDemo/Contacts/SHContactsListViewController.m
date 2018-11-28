//
//  SHContactsListViewController.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/28.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "SHContactsListViewController.h"
#import "SHConversationViewController.h"
#import "UserListService.h"
#import <RongIMKit/RongIMKit.h>
#import <UIImageView+WebCache.h>
#import "ContactCell.h"

@interface SHContactsListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *cellID = @"ContactCellID";

@implementation SHContactsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorColor = [UIColor whiteColor];
    self.tableView.userInteractionEnabled = YES;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[ContactCell class] forCellReuseIdentifier:cellID];
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[UserListService share] contacts].count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ContactCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    RCUserInfo * userInfo = [[UserListService share] contacts][indexPath.row];
    cell.titleLabel.text = userInfo.name;
    cell.idLabel.text = userInfo.userId;
    [cell.headerImageView sd_setImageWithURL:[NSURL URLWithString:userInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"avatar_users_72px_1108447_easyicon.net"]];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RCUserInfo *userInfo = [[UserListService share] contacts][indexPath.row];
    NSLog(@"%ld -- %@ -- %@ -- %@", (long)indexPath.row, userInfo.name, userInfo.userId, userInfo.portraitUri);
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return  0.001;
}

@end
