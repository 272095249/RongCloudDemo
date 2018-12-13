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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    // 设置输入框的默认输入模式
//    self.defaultInputType = RCChatSessionInputBarInputVoice;
    
}

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

            SHMessageContent *messageContent = [SHMessageContent messageWithTitle:@"标题测试" detail:@"详情测试" imageUrl:@"图片url" url:@"https://www.rongcloud.cn/"];
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
