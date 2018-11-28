//
//  SHConversationListViewController.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/28.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "SHConversationListViewController.h"
#import "SHConversationViewController.h"

@implementation SHConversationListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE), // 单聊
                                        @(ConversationType_DISCUSSION), // 讨论组
                                        @(ConversationType_GROUP), // 群
                                        @(ConversationType_CHATROOM) // 聊天室
                                        ]];
    
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                          @(ConversationType_GROUP)
                                          ]];
}


- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath {
    
    SHConversationViewController *chatVC = [[SHConversationViewController alloc] init];
    chatVC.conversationType = model.conversationType;
    chatVC.targetId = model.targetId;
    chatVC.title = model.conversationTitle; // 从会话列表这点击进入聊天页需要处理,讨论组和群聊可以直接使用
    chatVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatVC animated:YES];
}




@end
