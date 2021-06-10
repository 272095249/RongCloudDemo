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


@interface SHConversationViewController ()

@property (nonatomic, strong) RCMessageModel *longPressSelectedModel;

@end

// 聊天界面
@implementation SHConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupEmotionTab];
    
//    [self.chatSessionInputBarControl.pluginBoardView insertItemWithImage:[UIImage imageNamed:@"urlPic"] title:@"链接" tag:2001];
    /*!
     注册自定义消息的Cell
     
     @param cellClass     自定义消息cell的类
     @param messageClass  自定义消息Cell对应的自定义消息的类，该自定义消息需要继承于RCMessageContent
     
     @discussion
     你需要在cell中重写RCMessageBaseCell基类的sizeForMessageModel:withCollectionViewWidth:referenceExtraHeight:来计算cell的高度。
     */
    [self registerClass:[SHWebMessageCell class] forMessageClass:[SHMessageContent class]];
    
    // 收到已读回执
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onReceiveMessageReadReceipt) name:RCLibDispatchReadReceiptNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    // 设置输入框的默认输入模式
//    self.defaultInputType = RCChatSessionInputBarInputVoice;

// 设置公众号
//    [self.chatSessionInputBarControl setInputBarType:RCChatSessionInputBarControlPubType style:RC_CHAT_INPUT_BAR_STYLE_SWITCH_CONTAINER_EXTENTION];
//
//    RCPublicServiceMenuItem *speatItem = [[RCPublicServiceMenuItem alloc] init];
//    speatItem.name = @"开始发言";
//    speatItem.type = RC_PUBLIC_SERVICE_MENU_ITEM_VIEW;
//    speatItem.url = @"www.rongcloud.cn";
//
//    RCPublicServiceMenu *menu = [[RCPublicServiceMenu alloc] init];
//    menu.menuItems = @[speatItem];
//    self.chatSessionInputBarControl.publicServiceMenu = menu;

//    // 下面方法设置会失败
//    self.chatSessionInputBarControl.publicServiceMenu.menuItems = @[speatItem];
    
    
    //    [self.chatSessionInputBarControl.publicServiceMenu setMenuItems:@[speatItem]];
    
    // 设置进入界面后显示输入框
    //    [self.chatSessionInputBarControl updateStatus:KBottomBarKeyboardStatus animated:YES];
    //    self.conversationMessageCollectionView.frame =CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64);
    //    self.chatSessionInputBarControl.hidden = YES;
    //    [self.chatSessionInputBarControl setInputBarType:RCChatSessionInputBarControlDefaultType style:RC_CHAT_INPUT_BAR_STYLE_EXTENTION_CONTAINER];
    
}

// 兼容横竖屏切换后布局错乱问题
//-(void)viewDidLayoutSubviews {
//
//    CGRect frame = self.view.bounds;
//    float height = 44;
//    if (@available(iOS 11.0, *)) {
//        height += [[[UIApplication sharedApplication] keyWindow] safeAreaInsets].top;
//    } else {
//        height += 20;
//    }
//    frame.origin.y = height;
//    frame.size.height = frame.size.height - RC_ChatSessionInputBar_Height - height;
//    self.conversationMessageCollectionView.frame = frame;
//    for (RCMessageModel * model in self.conversationDataRepository) {
//        model.cellSize = CGSizeZero;
//    }
//    [self.conversationMessageCollectionView reloadData];
//
//    UIView * collectionViewHeader = [self valueForKey:@"collectionViewHeader"]; // 私有方法
//    collectionViewHeader.frame = CGRectMake(0, -40, self.view.bounds.size.width, 40);
//
//    CGRect controlFrame = self.chatSessionInputBarControl.frame;
//    controlFrame.size.width=self.view.frame.size.width;
//    controlFrame.origin.y=self.conversationMessageCollectionView.frame.size.height-self.chatSessionInputBarControl.frame.size.height;
//    self.chatSessionInputBarControl.frame=controlFrame;
//
//    CGRect inputContainerViewFrame = self.chatSessionInputBarControl.inputContainerView.frame;
//    inputContainerViewFrame.size.width = self.view.frame.size.width;
//
//    CGRect inputTextViewFrame = self.chatSessionInputBarControl.inputTextView.frame;
//    inputTextViewFrame.size.width = self.chatSessionInputBarControl.frame.size.width-132;
//    if (self.chatSessionInputBarControl.menuContainerView) {
//        inputContainerViewFrame.size.width = inputContainerViewFrame.size.width - 42;// SwitchButtonWidth
//        inputTextViewFrame.size.width = inputTextViewFrame.size.width - 41;
//
//        // 如果包含公众号菜单需要正常调整视图大小
//        self.chatSessionInputBarControl.menuContainerView.frame = inputContainerViewFrame;
//        self.chatSessionInputBarControl.publicServiceMenu = self.chatSessionInputBarControl.publicServiceMenu;
//    }
//    self.chatSessionInputBarControl.inputContainerView.frame = inputContainerViewFrame;
//    self.chatSessionInputBarControl.inputTextView.frame = inputTextViewFrame;
//    [self.chatSessionInputBarControl containerViewSizeChangedNoAnnimation];
//}

// 为了修改已读样式添加
- (void)willDisplayMessageCell:(RCMessageBaseCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    [super willDisplayMessageCell:cell atIndexPath:indexPath];
    
    //    RCMessageCell *messageCell = (RCMessageCell *)cell;
    //    for (UIView *subView in messageCell.messageHasReadStatusView.subviews) {
    //        subView.hidden = YES;
    //    }
    //
    //    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(-10, -5, 24, 12)];
    //    label.text = @"已读";
    //    label.clipsToBounds = YES;
    //    label.layer.cornerRadius = 3;
    //    label.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    //    label.font = [UIFont systemFontOfSize:10];
    //    [messageCell.messageHasReadStatusView addSubview:label];
    
}

// 为了试验附加信息2
- (RCMessageContent *)willSendMessage:(RCMessageContent *)messageContent {
    
    if ([messageContent isKindOfClass:[RCTextMessage class]]) {
        
        RCTextMessage *textMessage = (RCTextMessage*)messageContent;
        
        textMessage.extra = @"附加信息";
        
        return textMessage;
        
    }
    
    // 测试图片上传至自己的服务器
//    if ([messageContent isKindOfClass:[RCImageMessage class]]) {
//        
//        [self sendMediaMessage:messageContent pushContent:@"picture test" appUpload:YES];
//        
//        return nil;
//    }
    
    return messageContent;
}

// 测试图片上传至自己的服务器
//- (void)uploadMedia:(RCMessage *)message uploadListener:(RCUploadMediaStatusListener *)uploadListener {
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        BOOL isSuccess = NO;
//        
//        int i = 0;
//        
//        for (i = 0; i < 10; i++) {
//            
//            uploadListener.updateBlock(i);
//            
//            [NSThread sleepForTimeInterval:0.2];
//            
//            isSuccess = YES;
//            
//        }
//        
//        if(isSuccess){//如果上传成功
//            
//            NSLog(@"上传成功");
//            
//            RCImageMessage *targetMessage = (RCImageMessage *)message.content;
//            
//            targetMessage.imageUrl = @"http://www.rongcloud.cn/images/newVersion/bannerInner.png?0717";
//            
//            uploadListener.successBlock(targetMessage);
//            
//        }else {//如果上传失败
//            
//            uploadListener.errorBlock(-1);
//            
//        }
//        
//    });
//}

// 为了试验发送消息成功后添加动画
- (void)didSendMessage:(NSInteger)status content:(RCMessageContent *)messageContent {
    
    [super didSendMessage:status content:messageContent];
    
    //    if (status == 0) {
    //        dispatch_async(dispatch_get_main_queue(), ^{
    //            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 200, 30)];
    //            label.frame = CGRectMake(20, 20, 30, 30);
    //            label.center = self.conversationMessageCollectionView.center;
    //            label.text = @"我是美女";
    //            label.font = [UIFont systemFontOfSize:30];
    //            [label sizeToFit];
    //            label.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:195/255.0 alpha:1];
    //            label.textAlignment = NSTextAlignmentCenter;
    //            label.backgroundColor = [UIColor greenColor];
    //            [self.conversationMessageCollectionView addSubview:label];
    //            //            [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
    //            //                self.kfButton.frame = CGRectMake(0, 0, 100, 40);
    //            //            } completion:^(BOOL finished) {
    //            //                NSLog(@"finished");
    //            //            }];
    //        });
    //    }
}

// 功能面板点击
- (void)pluginBoardView:(RCPluginBoardView *)pluginBoardView clickedItemWithTag:(NSInteger)tag {
    switch (tag) {
        case 2001: {
            [super pluginBoardView:pluginBoardView clickedItemWithTag:tag];

            SHMessageContent *messageContent = [SHMessageContent messageWithTitle:@"标题测试" detail:@"详情测试" imageUrl:@"图片url" url:@"https://www.rongcloud.cn/"];
            
            // 测试 Lib 中发送自定义消息
//            [[RCIMClient sharedRCIMClient] sendMessage:self.conversationType targetId:self.targetId content:messageContent pushContent:nil pushData:nil success:^(long messageId) {
//                NSLog(@"发送成功");
//            } error:^(RCErrorCode nErrorCode, long messageId) {
//                NSLog(@"发送失败 - %ld - %ld", (long)nErrorCode, messageId);
//            }];
            
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

// 测试撤回他人消息
- (NSArray<UIMenuItem *> *)getLongTouchMessageCellMenuList:(RCMessageModel *)model {
    UIMenuItem *recallItem =
    [[UIMenuItem alloc] initWithTitle:NSLocalizedStringFromTable(@"Recall", @"RongCloudKit", nil)
                               action:@selector(onRecallMessage:)];
    
    NSMutableArray *items = @[].mutableCopy;
    [items addObject:recallItem];
    return items.copy;
}

- (void)onRecallMessage:(id)sender {
    
    RCMessage *msg = [[RCIMClient sharedRCIMClient] getMessage:self.longPressSelectedModel.messageId];
    
    __weak typeof(self) ws = self;
    [[RCIMClient sharedRCIMClient] recallMessage:msg pushContent:@"撤回消息" success:^(long messageId) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [ws.conversationDataRepository removeObject:ws.longPressSelectedModel];
            [ws.conversationMessageCollectionView reloadData];
        });
    } error:^(RCErrorCode errorcode) {
        NSLog(@"%ld",(long)errorcode);
    }];
    [self.conversationMessageCollectionView reloadData];
}

- (void)didLongTouchMessageCell:(RCMessageModel *)model inView:(UIView *)view {
    self.longPressSelectedModel = model;
    [super didLongTouchMessageCell:model inView:view];
}

// 重写点击 return 按钮
- (void)inputTextViewDidTouchSendKey:(UITextView *)inputTextView {
    RCTextMessage *rcTextMessage = [RCTextMessage messageWithContent:inputTextView.text];
    
    rcTextMessage.mentionedInfo = self.chatSessionInputBarControl.mentionedInfo;
    [self sendMessage:rcTextMessage pushContent:nil];
    NSLog(@"点击 return 按钮");
}

- (void)onReceiveMessageReadReceipt {
    
    NSLog(@"------------ 收到了已读回执");
}

//按钮点击事件的代理
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"clickButtonAtIndex:%d",(int)buttonIndex);
    
}

- (void)setupEmotionTab {
    UIImage *icon = [UIImage imageNamed:@"桃心"];
    
    SHExpressionTab *expressionTab = [SHExpressionTab new];
    expressionTab.identify = @"1";
    expressionTab.image = icon;
    expressionTab.pageCount = 5;
    [self.chatSessionInputBarControl.emojiBoardView addEmojiTab:expressionTab];
}

@end
