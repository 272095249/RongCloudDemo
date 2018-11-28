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
    chatVC.conversationType = 0;
    chatVC.targetId = @"model.id";
    chatVC.title = @"";
    [self.navigationController pushViewController:chatVC animated:YES];
}


@end
