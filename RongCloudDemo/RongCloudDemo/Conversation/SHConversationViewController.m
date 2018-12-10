//
//  SHConversationViewController.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/28.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "SHConversationViewController.h"
#import "SHMessageContent.h"
#import "SHWebMessageCell.h"
#import "SHExpressionTab.h"

// 聊天界面
@implementation SHConversationViewController

//- (void)viewWillAppear:(BOOL)animated {
//    // 设置输入框的默认输入模式
//    self.defaultInputType = RCChatSessionInputBarInputVoice;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self setupEmotionTab];
    
//    [self.chatSessionInputBarControl.pluginBoardView insertItemWithImage:[UIImage imageNamed:@"urlPic"] title:@"链接" tag:2001];
    /*!
     注册自定义消息的Cell
     
     @param cellClass     自定义消息cell的类
     @param messageClass  自定义消息Cell对应的自定义消息的类，该自定义消息需要继承于RCMessageContent
     
     @discussion
     你需要在cell中重写RCMessageBaseCell基类的sizeForMessageModel:withCollectionViewWidth:referenceExtraHeight:来计算cell的高度。
     */
    [self registerClass:[SHWebMessageCell class] forMessageClass:[SHMessageContent class]];
}

- (void)setupEmotionTab {
    UIImage *icon = [UIImage imageNamed:@"桃心"];
    
    SHExpressionTab *expressionTab = [SHExpressionTab new];
    expressionTab.identify = @"1";
    expressionTab.image = icon;
    expressionTab.pageCount = 2;
    [self.chatSessionInputBarControl.emojiBoardView addEmojiTab:expressionTab];
}

// 功能面板点击
- (void)pluginBoardView:(RCPluginBoardView *)pluginBoardView clickedItemWithTag:(NSInteger)tag {
    switch (tag) {
        case 2001: {
            [super pluginBoardView:pluginBoardView clickedItemWithTag:tag];

            SHMessageContent *messageContent = [SHMessageContent messageWithTitle:@"标题测试" detail:@"详情测试" imageUrl:@"data:image/jpeg;base64,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" url:@"https://www.rongcloud.cn/"];
            [self sendMessage:messageContent pushContent:nil];
            break;
        }
        default:
            [super pluginBoardView:pluginBoardView clickedItemWithTag:tag];
            break;
    }
}

- (void)didTapMessageCell:(RCMessageModel *)model {
    
    if ([model.content isMemberOfClass:SHMessageContent.class]) {
        SHMessageContent *content = (SHMessageContent *)model.content;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"跳转网页"
                                                        message:content.url
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"OK",nil];
        [alert show];
    } else {
        [super didTapMessageCell:model];
    }    
}

- (void)didLongTouchMessageCell:(RCMessageModel *)model inView:(UIView *)view {
    [super didLongTouchMessageCell:model inView:view];
}

//按钮点击事件的代理
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"clickButtonAtIndex:%d",(int)buttonIndex);
    
}

@end
