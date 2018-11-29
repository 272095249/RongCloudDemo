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

// 聊天界面
@implementation SHConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.chatSessionInputBarControl.pluginBoardView insertItemWithImage:[UIImage imageNamed:@"urlPic"] title:@"链接" tag:2001];
    /*!
     注册自定义消息的Cell
     
     @param cellClass     自定义消息cell的类
     @param messageClass  自定义消息Cell对应的自定义消息的类，该自定义消息需要继承于RCMessageContent
     
     @discussion
     你需要在cell中重写RCMessageBaseCell基类的sizeForMessageModel:withCollectionViewWidth:referenceExtraHeight:来计算cell的高度。
     */
    [self registerClass:[SHWebMessageCell class] forMessageClass:[SHMessageContent class]];
}

// 功能面板点击
- (void)pluginBoardView:(RCPluginBoardView *)pluginBoardView clickedItemWithTag:(NSInteger)tag {
    switch (tag) {
        case 2001: {
            [super pluginBoardView:pluginBoardView clickedItemWithTag:tag];
            
            SHMessageContent *messageContent = [SHMessageContent messageWithTitle:@"标题测试" detail:@"详情测试" imageUrl:@"http://upload-images.jianshu.io/upload_images/1253108-b15a877810599334.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" url:@"https://www.rongcloud.cn/"];
            [self sendMessage:messageContent pushContent:nil];
            break;
        }
        default:
            [super pluginBoardView:pluginBoardView clickedItemWithTag:tag];
            break;
    }
}

- (void)didTapMessageCell:(RCMessageModel *)model {
    
    SHMessageContent *content = (SHMessageContent *)model.content;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"跳转网页"
                                                    message:content.url
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK",nil];
    [alert show];
}

- (void)didLongTouchMessageCell:(RCMessageModel *)model inView:(UIView *)view {
    [super didLongTouchMessageCell:model inView:view];
}

//按钮点击事件的代理
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"clickButtonAtIndex:%d",(int)buttonIndex);
    
}

@end
