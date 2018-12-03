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
#import <RongIMLib/RCCommandMessage.h> // 命令消息类
#import <RongIMLib/RCCommandNotificationMessage.h> // 命令提醒消息类
#import <RongIMLib/RCContactNotificationMessage.h> // 请求添加好友消息类(请求/同意/拒绝/发起ID/目标ID/附加信息等)
#import <RongIMLib/RCDiscussionNotificationMessage.h> // 讨论组通知消息类(成员加入/退出/被踢/讨论组名称修改/权限变更/操作人信息)
#import <RongIMLib/RCGroupNotificationMessage.h> // 群组通知消息类(成员加入/退出/被踢/名称变更/公告变更/操作人以及消息内容)
#import <RongIMLib/RCImageMessage.h> // 图片消息(url/本地路径/缩略图/是否发送原图/附加信息/原始图片信息-image/原始图片信息-data)
#import <RongIMLib/RCInformationNotificationMessage.h> // 通知消息类(内容/附加信息)
#import <RongIMLib/RCLocationMessage.h> // 地理位置消息类(位置二维坐标/位置名称/位置缩略图/附加信息)
#import <RongIMLib/RCMessage.h> // 消息实体类(会话类型/目标ID/消息ID/消息方向/发送者ID/接收-发送状态/接收-发送时间/消息类型/内容/附加字段/唯一MessageUId/阅读回执)
#import <RongIMLib/RCMessageContent.h> // 消息内容的编解码协议(序列化成json/将json反序列化成消息内容/消息类型名/发送者用户信息/@提醒)
#import <RongIMLib/RCProfileNotificationMessage.h> // 公众服务信息变更消息类(变更的相关内容)
#import <RongIMLib/RCPublicServiceCommandMessage.h> // 公众服务请求消息类(请求名称/内容/扩展数据)
#import <RongIMLib/RCPublicServiceMultiRichContentMessage.h> // 公众服务多图文消息类(多图文内容数组/附加信息)
#import <RongIMLib/RCPublicServiceRichContentMessage.h> // 公众服务图文消息类(内容/附加信息/)
#import <RongIMLib/RCRealTimeLocationEndMessage.h> // 实时位置共享结束信息类
#import <RongIMLib/RCRealTimeLocationStartMessage.h> // 实时位置共享开始信息类
#import <RongIMLib/RCRecallNotificationMessage.h> // 撤回通知消息类(发起撤回的用户ID/时间/消息类型名/是否是管理员操作)
#import <RongIMLib/RCRichContentMessage.h> // 图文消息类(标题/内容/图片URL/跳转URL/扩展信息)
#import <RongIMLib/RCTextMessage.h> // 文本消息类(内容/附加信息)
#import <RongIMLib/RCUnknownMessage.h> // 未知消息类
#import <RongIMLib/RCVoiceMessage.h> // 语音消息类(音频数据-wav/时长/附加信息)
#import <RongIMLib/RCSightMessage.h> // 小视频消息类(本地URL地址/网络URL地址/时长/文件名/大小/缩略图/扩展字段)
/// 工具类
#import <RongIMLib/RCAMRDataConverter.h> // AMR格式与WAV格式音频转换工具类
#import <RongIMLib/RCTSMutableDictionary.h>
#import <RongIMLib/RCUtilities.h> // 工具类(NSData与base64互转/image缩放/文字显示尺寸/是否是本地路径/是否是网络网址/获取沙盒修正后的文件路径/文件存储路径/App文件存放路径/融云SDK文件存放与缓存路径/当前系统时间/当前运营商名称/当前网络类型/系统版本/设备型号/非换行字符串/消息内容对应的媒体类型/图片是否含透明像素)
#import <RongIMLib/interf_dec.h>
#import <RongIMLib/interf_enc.h>
///客服
#import <RongIMLib/RCCSLeaveMessageItem.h> // 客服留言配置Model(信息名/对应的key/输入区域是单行或者多行/输入区域默认提示信息/是否必填/验证/最大字数限制)
#import <RongIMLib/RCCustomerServiceInfo.h> // 用户信息类(唯一标识/昵称/登录名/名称/等级/性别/生日/年龄/职业/头像/省份/城市/备注/电话/邮箱/地址/QQ/微博/微信/页面信息/来源/自定义信息/商品id)
#import <RongIMLib/RCEvaluateItem.h>

/// 其他
#import <RongIMLib/RCChatRoomMemberInfo.h> // 聊天室成员信息类(用户ID/加入时间)
#import <RongIMLib/RCCustomerServiceGroupItem.h> // 客服信息类(群组ID/名称/是否在线)
#import <RongIMLib/RCPublicServiceMenu.h> // 公众服务账号菜单类(菜单项数组)
#import <RongIMLib/RCPublicServiceProfile.h> // 公众服务账号信息(名称/描述/ID/头像URL/公众服务所有者/所有者URL/所有者联系电话/历史消息/地理位置/经营范围/账号类型/是否关注/账号菜单/是否禁用菜单/是否禁用输入框)
#import <RongIMLib/RCRealTimeLocationManager.h> // 实时位置共享监听器(参与者位置发生变化/有参与者加入/退出/更新位置失败/发起共享失败/代理-发起|加入|退出|注册|移除|获取参与者列表|获取共享状态|获取参与者当前位置)
#import <RongIMLib/RCStatusMessage.h>
#import <RongIMLib/RCUploadImageStatusListener.h> // 图片上传进度更新的消息类(更新上传进度/上传成功/上传失败)
#import <RongIMLib/RCUploadMediaStatusListener.h> // 媒体文件上传进度更新消息类(上传的媒体文件消息的消息实体/更新上传进度/上传成功/上传失败)
#import <RongIMLib/RCUserInfo.h> // 用户信息类(ID/名称/头像URL)
#import <RongIMLib/RCWatchKitStatusDelegate.h> // watch操作(连接状态发生变化/收到消息/发送消息/上传图片进度更新/删除会话/删除消息/删除未读消息/创建讨论组/创建成功和失败/讨论组加人|踢人|退出/)

#import <RongIMLib/RCFileMessage.h> // 文件消息类(文件名/文件大小/文件类型/文件网络地址/文件本地路径/附加信息)
#import <RongIMLib/RCFileUtility.h> // 设置文件媒体类型/获取上传文件名称/生成下载的文件路径
#import <RongIMLib/RCReadReceiptInfo.h> // 消息回执类 - 钉住(是否需要回执消息/是否已经发送回执/发送回执的用户ID列表)
#import <RongIMLib/RCUserOnlineStatusInfo.h> // 用户在线状态类(融云在线状态/平台)

// log
#import <RongIMLib/RCFwLog.h> // 打印log类

//Downlad
#import <RongIMLib/RCDownloadItem.h> // 任务下载类(下载状态/现在进度/任务结束/文件总大小/文件当前大小/文件对应的网络URL/是否可以恢复下载/下载任务的标识符/代理-开始下载|暂定下载|恢复下载|取消下载)
#import <RongIMLib/RCResumeableDownloader.h>
