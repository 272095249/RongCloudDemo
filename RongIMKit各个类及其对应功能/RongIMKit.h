//
//  RongIMKit.h
//  RongIMKit
//
//  Created by xugang on 15/1/13.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for RongIMKit.
FOUNDATION_EXPORT double RongIMKitVersionNumber;

//! Project version string for RongIMKit.
FOUNDATION_EXPORT const unsigned char RongIMKitVersionString[];

/// IMKit核心类
#import <RongIMKit/RCIM.h> // IM基本功能（SDK的初始化/连接服务器/断开服务器，各种消息的发送/撤回/已读/推送/取消/下载(媒体消息)/取消下载(媒体消息)，用户/群组/群名片信息，IMKit连接状态监听，消息通知提醒的管理，讨论组管理，头像/导航按钮字体管理）
/// 会话列表相关类
#import <RongIMKit/RCConversationListViewController.h> // 会话列表界面（初始化，列表管理，点击/删除/加载显示事件回调，自定义Cell相关回调，界面刷新操作）
#import <RongIMKit/RCPublicServiceListViewController.h> // 公众号列表界面
/// 会话页面相关类
#import <RongIMKit/RCConversationViewController.h> // 客服会话界面
#import <RongIMKit/RCImagePreviewController.h> // 查看图片显示的界面
#import <RongIMKit/RCImageSlideController.h> //
#import <RongIMKit/RCLocationPickerViewController.h> // 点击发送位置时显示的位置选择界面（地图，位置数据源）
#import <RongIMKit/RCLocationViewController.h> // 展示位置信息的界面：点击发送的位置信息进入的界面
#import <RongIMKit/RCPublicServiceChatViewController.h> // 公众号会话界面
#import <RongIMKit/RCPublicServiceSearchViewController.h> // 查找公众服务账号的界面
/// 会话列表Cell相关类
#import <RongIMKit/RCConversationBaseCell.h> // 会话Cell的基类：含会话cell的数据模型
#import <RongIMKit/RCConversationCell.h> // 会话Cell类：含Cell点击回调，Cell子视图设置，Cell头像点击的回调；如果想对 Cell 中某个控件的颜色，字体大小等做修改，强转成 RCConversationCell，再取相关控件做修改
#import <RongIMKit/RCConversationModel.h> // 会话Cell的数据模型类
/// 消息Cell相关类
#import <RongIMKit/RCFileMessageCell.h> // 文件消息Cell
#import <RongIMKit/RCImageMessageCell.h> // 图片消息Cell
#import <RongIMKit/RCImageMessageProgressView.h> // 图片消息进度的View：显示在图片消息Cell中
#import <RongIMKit/RCLocationMessageCell.h> // 位置消息Cell
#import <RongIMKit/RCMessageBaseCell.h> // 消息Cell的基类（有两种子类：有用户头像的RCTipMessageCell和没有用户头像的RCMessageCell、RCUnknownMessageCell）
#import <RongIMKit/RCMessageCell.h> // 展示的消息Cell类：含用户头像等信息，消息状态，数据模型以及更新消息发送状态
#import <RongIMKit/RCMessageCellDelegate.h> // 各种点击Cell以及子视图的回调：点击url、电话、头像、消息发送失败红点、消息阅读人数、媒体消息取消发送以及公众号Cell中的点击，长按头像、Cell内容，
#import <RongIMKit/RCMessageCellNotificationModel.h> // Cell状态更新通知的数据模型：开始、失败、成功、取消、进度、更新、已读等
#import <RongIMKit/RCMessageModel.h> // 消息Cell的数据模型类
#import <RongIMKit/RCRichContentMessageCell.h> // 富文本(图文)消息Cell：公众号中入职指南
#import <RongIMKit/RCTextMessageCell.h> // 文本消息Cell：内容Label，背景View以及数据模型
#import <RongIMKit/RCTipMessageCell.h> // 提示消息Cell，不显示用户头像等信息
#import <RongIMKit/RCUnknownMessageCell.h> // 未知消息Cell，不显示用户头像等信息
#import <RongIMKit/RCVoiceMessageCell.h> // 语音消息Cell

/// 工具类
#import <RongIMKit/RCKitUtility.h> // IMKIT工具类：包含时间转换，获取资源包中的图片，获取颜色，获取文字尺寸，获取消息内容的摘要，消息是否需要显示，验证手机号、邮箱、url开头是否是http/https，获取汉字对应的拼音首字母等等
#import <RongIMKit/RCThemeDefine.h> // 头像显示的形状：矩形/圆形
/// 其他
#import <RongIMKit/RCAttributedLabel.h> // 属性字符串Label
#import <RongIMKit/RCBaseViewController.h> // ViewController基类：定义View的默认大小，是否开启左滑返回手势
#import <RongIMKit/RCContentView.h> // 消息内容View
#import <RongIMKit/RCConversationSettingTableViewHeader.h> // 聊天设置界面操作群成员的HeaderView
#import <RongIMKit/RCEmoticonTabSource.h> // 自定义表情View的数据源代理
#import <RongIMKit/RCMessageBubbleTipView.h> // 消息未读提示角标View：可设置位置(上下左右等)，角标显示的内容、角标颜色、阴影颜色、背景颜色、文本字体、是否显示数字
#import <RongIMKit/RCPublicServiceProfileViewController.h> // 公众号详情VC
#import <RongIMKit/RCSettingViewController.h> // 设置界面
#import <RongIMKit/RCTextView.h> // 文本框输入View
#import <RongIMKit/RCTipLabel.h> // 灰条提示Label
#import <RongIMKit/RongIMKitExtensionModule.h> // RongCloud IM扩展模块协议
/// VoIPCall
