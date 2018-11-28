//
//  SHGroupListViewController.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/28.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "SHGroupListViewController.h"
#import "SHConversationViewController.h"
#import "UserService.h"
#import <UIImageView+WebCache.h>
#import "ContactCell.h"

@interface SHGroupListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *groupCellID = @"GroupCellID";

@implementation SHGroupListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorColor = [UIColor whiteColor];
    self.tableView.userInteractionEnabled = YES;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[ContactCell class] forCellReuseIdentifier:groupCellID];
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[UserService share] groups].count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:groupCellID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ContactCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:groupCellID];
    }
    
    RCGroup *group = [[UserService share] groups][indexPath.row];
    cell.titleLabel.text = group.groupName;
    cell.idLabel.text = group.groupId;
    [cell.headerImageView sd_setImageWithURL:[NSURL URLWithString:group.portraitUri] placeholderImage:[UIImage imageNamed:@"avatar_users_72px_1108447_easyicon.net"]];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RCGroup *group = [[UserService share] groups][indexPath.row];
    // 点击自己时需要处理
    
    SHConversationViewController *chatVC = [[SHConversationViewController alloc] init];
    chatVC.conversationType = ConversationType_GROUP;
    chatVC.targetId = group.groupId;
    chatVC.title = group.groupName;
    chatVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatVC animated:YES];
}

@end
