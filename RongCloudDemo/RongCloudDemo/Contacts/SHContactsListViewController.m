//
//  SHContactsListViewController.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/28.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "SHContactsListViewController.h"
#import "SHConversationViewController.h"
#import "UserService.h"
#import <RongCloudOpenSource/RongIMKit.h>
#import <UIImageView+WebCache.h>
#import "ContactCell.h"

@interface SHContactsListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *contactCellID = @"ContactCellID";

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
    
    [self.tableView registerClass:[ContactCell class] forCellReuseIdentifier:contactCellID];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[UserService share] contacts].count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:contactCellID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ContactCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:contactCellID];
    }
    
    RCUserInfo * userInfo = [[UserService share] contacts][indexPath.row];
    cell.titleLabel.text = userInfo.name;
    cell.idLabel.text = userInfo.userId;
    [cell.headerImageView sd_setImageWithURL:[NSURL URLWithString:userInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"avatar_users_72px_1108447_easyicon.net"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RCUserInfo *userInfo = [[UserService share] contacts][indexPath.row];
    
    if ([userInfo.userId isEqualToString:[RCIM sharedRCIM].currentUserInfo.userId]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"不能和自己聊天" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        return;
    }
    
    SHConversationViewController *chatVC = [[SHConversationViewController alloc] init];
    chatVC.conversationType = ConversationType_PRIVATE;
    chatVC.targetId = userInfo.userId;
    chatVC.title = userInfo.name;
    chatVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatVC animated:YES];
}

@end
