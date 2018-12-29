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
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *ids;

@end

static NSString *groupCellID = @"GroupCellID";

@implementation SHGroupListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"测试聊天室1", @"测试聊天室2", @"测试聊天室3"];
    self.ids = @[@"10001", @"10002", @"10003"];
    
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return section == 0 ? [[UserService share] groups].count : self.titles.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:groupCellID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ContactCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:groupCellID];
    }
    
    if (indexPath.section == 0) {
        RCGroup *group = [[UserService share] groups][indexPath.row];
        cell.titleLabel.text = group.groupName;
        cell.idLabel.text = group.groupId;
        [cell.headerImageView sd_setImageWithURL:[NSURL URLWithString:group.portraitUri] placeholderImage:[UIImage imageNamed:@"avatar_users_72px_1108447_easyicon.net"]];
    } else {
        cell.titleLabel.text = self.titles[indexPath.row];
        cell.idLabel.text = self.ids[indexPath.row];
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SHConversationViewController *chatVC = [[SHConversationViewController alloc] init];
    
    if (indexPath.section == 0) {
        RCGroup *group = [[UserService share] groups][indexPath.row];
        chatVC.conversationType = ConversationType_GROUP;
        chatVC.targetId = group.groupId;
        chatVC.title = group.groupName;
    } else {
        chatVC.conversationType = ConversationType_CHATROOM;
        // 设置聊天室不获取历史消息
        chatVC.defaultHistoryMessageCountOfChatRoom = -1;
        chatVC.targetId = self.ids[indexPath.row];
        chatVC.title = self.titles[indexPath.row];
    }
    chatVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatVC animated:YES];
}

@end
