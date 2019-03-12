//
//  SHConversationListViewController.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/28.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "SHConversationListViewController.h"
#import "SHConversationViewController.h"
#import "UserService.h"

@interface SHConversationListViewController ()

@end

@implementation SHConversationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadConversationListVC) name:@"connectionStatusChanged" object:nil];

    
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE), // 单聊
                                        @(ConversationType_DISCUSSION), // 讨论组
                                        @(ConversationType_GROUP), // 群
                                        @(ConversationType_CHATROOM) // 聊天室
                                        ]];
    
}

// 兼容横竖屏切换后布局错乱问题
-(void)viewDidLayoutSubviews {
    self.conversationListTableView.frame = self.view.bounds;
    CGRect windowBounds = self.view.window.frame;
    if (CGRectEqualToRect(windowBounds, CGRectZero)) {
        return;
    }
    CGRect detailedFrame = CGRectZero;;
    detailedFrame.origin = CGPointMake(0, 0);
    detailedFrame.size.height = windowBounds.size.height;
    detailedFrame.size.width = windowBounds.size.width - self.view.bounds.size.width;
}

// 测试设置头像
- (void)willDisplayConversationTableCell:(RCConversationBaseCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    RCConversationCell *cells = (RCConversationCell *)cell;
    ((UIImageView *)cells.headerImageView).layer.cornerRadius = ((UIImageView *)cells.headerImageView).frame.size.width / 2;
}

- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath {
    
    SHConversationViewController *chatVC = [[SHConversationViewController alloc] init];
    chatVC.conversationType = model.conversationType;
    chatVC.targetId = model.targetId;
    
    // 从会话列表这点击进入聊天页需要处理标题
    switch (model.conversationType) {
        case ConversationType_PRIVATE: {
            [[UserService share] getUserInfoWithUserId:model.targetId completion:^(RCUserInfo * _Nonnull userInfo) {
                chatVC.title = userInfo.name;
            }];
            break;
        }
        case ConversationType_GROUP: {
            [[UserService share] getGroupInfoWithGroupId:model.targetId completion:^(RCGroup * _Nonnull groupInfo) {
                chatVC.title = groupInfo.groupName;
            }];
            break;
        }
        default:
            chatVC.title = model.conversationTitle;
            break;
    }
    
    chatVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatVC animated:YES];
}

- (void)reloadConversationListVC {
    [self refreshConversationTableViewIfNeeded];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
