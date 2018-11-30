/**
 * Copyright (c) 2014-2015, RongCloud.
 * All rights reserved.
 *
 * All the contents are the copyright of RongCloud Network Technology Co.Ltd.
 * Unless otherwise credited. http://rongcloud.cn
 *
 */

//  RongIMLib.h
//  Created by xugang on 14/12/11.

#import <UIKit/UIKit.h>

//! Project version number for RongIMLib.
FOUNDATION_EXPORT double RongIMLibVersionNumber;

//! Project version string for RongIMLib.
FOUNDATION_EXPORT const unsigned char RongIMLibVersionString[];

/// IMLib核心类
#import <RongIMLib/RCIMClient.h> // 消息回调处理，IMLib连接状态监听，聊天室监听以及回调，输入状态监听，日志监听，SDK初始化/导航服务器和文件服务器设置/连接服务器/断开服务器，用户信息管理，消息接收/发送/取消/插入/下载/取消下载，媒体消息管理，消息已读回执管理，获取/清除/删除指定消息操作，会话列表操作(获取/分页获取，删除/指定会话，草稿的获取/保存/删除，未读消息数的获取/清除)，消息屏蔽设置相关操作，讨论组操作(创建/加入/踢人/退出/获取/设置，建议使用群组)，群组操作，聊天室操作(加入/退出/获取)，公众服务(查找/关注/取关/获取信息)，数据统计，客服相关操作(发起客服聊天/结束/分组/切换客服模式/评价/留言)，搜索，工具类方法(类型互转/时间差)

#import <RongIMLib/RCStatusDefine.h> // 错误码相关(建立连接/网络连接状态/具体业务代码/当前所处网络/SDK当前状态/会话类型/会话提醒状态/消息回执/聊天室成员排列顺序/消息存储策略/消息方向/消息的发送接收状态/消息类型/消息中@提醒类型/公众号相关/日志级别/历史消息查询顺序/语言设置)
/// 会话相关类
#import <RongIMLib/RCChatRoomInfo.h> // 聊天室相关(ID/成员列表/成员总数)
#import <RongIMLib/RCConversation.h> // 会话相关(会话类型/ID/标题/未读数量/置顶/草稿)
#import <RongIMLib/RCDiscussion.h> // 讨论组相关(ID/名称/创建者ID/用户列表/加人权限/初始化)
#import <RongIMLib/RCGroup.h> // 群组相关(ID/名称/头像URL/初始化)
#import <RongIMLib/RCUserTypingStatus.h> // 用户输入状态相关(正在输入的用户ID/正在输入的消息类型名/初始化)
/// 消息相关类
#import <RongIMLib/RCCSLeaveMessage.h>
#import <RongIMLib/RCCSPullLeaveMessage.h>
#import <RongIMLib/RCCommandMessage.h>
#import <RongIMLib/RCCommandNotificationMessage.h>
#import <RongIMLib/RCContactNotificationMessage.h>
#import <RongIMLib/RCDiscussionNotificationMessage.h>
#import <RongIMLib/RCGroupNotificationMessage.h>
#import <RongIMLib/RCImageMessage.h>
#import <RongIMLib/RCInformationNotificationMessage.h>
#import <RongIMLib/RCLocationMessage.h>
#import <RongIMLib/RCMessage.h>
#import <RongIMLib/RCMessageContent.h>
#import <RongIMLib/RCProfileNotificationMessage.h>
#import <RongIMLib/RCPublicServiceCommandMessage.h>
#import <RongIMLib/RCPublicServiceMultiRichContentMessage.h>
#import <RongIMLib/RCPublicServiceRichContentMessage.h>
#import <RongIMLib/RCRealTimeLocationEndMessage.h>
#import <RongIMLib/RCRealTimeLocationStartMessage.h>
#import <RongIMLib/RCRecallNotificationMessage.h>
#import <RongIMLib/RCRichContentMessage.h>
#import <RongIMLib/RCTextMessage.h>
#import <RongIMLib/RCUnknownMessage.h>
#import <RongIMLib/RCVoiceMessage.h>
#import <RongIMLib/RCSightMessage.h>
/// 工具类
#import <RongIMLib/RCAMRDataConverter.h>
#import <RongIMLib/RCTSMutableDictionary.h>
#import <RongIMLib/RCUtilities.h>
#import <RongIMLib/interf_dec.h>
#import <RongIMLib/interf_enc.h>
///客服
#import <RongIMLib/RCCSLeaveMessageItem.h>
#import <RongIMLib/RCCustomerServiceInfo.h>
#import <RongIMLib/RCEvaluateItem.h>

/// 其他
#import <RongIMLib/RCChatRoomMemberInfo.h>
#import <RongIMLib/RCCustomerServiceGroupItem.h>
#import <RongIMLib/RCPublicServiceMenu.h>
#import <RongIMLib/RCPublicServiceProfile.h>
#import <RongIMLib/RCRealTimeLocationManager.h>
#import <RongIMLib/RCStatusMessage.h>
#import <RongIMLib/RCUploadImageStatusListener.h>
#import <RongIMLib/RCUploadMediaStatusListener.h>
#import <RongIMLib/RCUserInfo.h>
#import <RongIMLib/RCWatchKitStatusDelegate.h>

#import <RongIMLib/RCFileMessage.h>
#import <RongIMLib/RCFileUtility.h>
#import <RongIMLib/RCReadReceiptInfo.h>
#import <RongIMLib/RCUserOnlineStatusInfo.h>

// log
#import <RongIMLib/RCFwLog.h>

//Downlad
#import <RongIMLib/RCDownloadItem.h>
#import <RongIMLib/RCResumeableDownloader.h>
