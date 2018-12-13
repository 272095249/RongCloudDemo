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

@interface SHConversationViewController ()

@end

@implementation SHConversationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE), // 单聊
                                        @(ConversationType_DISCUSSION), // 讨论组
                                        @(ConversationType_GROUP), // 群
                                        @(ConversationType_CHATROOM) // 聊天室
                                        ]];
    
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

@end
