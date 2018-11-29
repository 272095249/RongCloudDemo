//
//  SHMessageContent.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/28.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "SHMessageContent.h"
#import <RongIMKit/RongIMKit.h>

@implementation SHMessageContent

+ (instancetype)messageWithTitle:(NSString *)title detail:(NSString *)detail imageUrl:(NSString *)imageUrl url:(NSString *)url {
    
    SHMessageContent *message = [SHMessageContent new];
    message.title = title;
    message.detail = detail;
    message.imageUrl = imageUrl;
    message.url = url;
    return message;
}

/*!
 返回消息的存储策略
 
 @return 消息的存储策略
 @discussion 指明此消息类型在本地是否存储、是否计入未读消息数。
 */
+ (RCMessagePersistent)persistentFlag {
    return (MessagePersistent_ISPERSISTED | MessagePersistent_ISCOUNTED);
}

// NSCoding（反序列化）
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.detail = [aDecoder decodeObjectForKey:@"detail"];
        self.imageUrl = [aDecoder decodeObjectForKey:@"imageUrl"];
        self.url = [aDecoder decodeObjectForKey:@"url"];
    }
    return self;
}

// NSCoding 序列化
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.detail forKey:@"detail"];
    [aCoder encodeObject:self.imageUrl forKey:@"imageUrl"];
    [aCoder encodeObject:self.url forKey:@"url"];
}

// 将消息内容编码成json
- (NSData *)encode {
    NSMutableDictionary *dataDict = [NSMutableDictionary dictionary];
    [dataDict setObject:self.title forKey:@"title"];
    [dataDict setObject:self.detail forKey:@"detail"];
    [dataDict setObject:self.imageUrl forKey:@"imageUrl"];
    [dataDict setObject:self.url forKey:@"url"];
    
    // 需存储发送消息用户的信息
    if (self.senderUserInfo) {
        NSMutableDictionary *userInfoDict = [NSMutableDictionary dictionary];
        if (self.senderUserInfo.name) {
            [userInfoDict setObject:self.senderUserInfo.name forKey:@"name"];
        }
        if (self.senderUserInfo.portraitUri) {
            [userInfoDict setObject:self.senderUserInfo.portraitUri forKeyedSubscript:@"portraitUri"];
        }
        if (self.senderUserInfo.userId) {
            [userInfoDict setObject:self.senderUserInfo.userId forKeyedSubscript:@"userId"];
        }
        [dataDict setObject:userInfoDict forKey:@"userInfo"];
    }
    
    
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dataDict options:kNilOptions error:nil];
    
    return data;
}

// 将json解码生成消息内容
- (void)decodeWithData:(NSData *)data {
    if (data) {
        __autoreleasing NSError *error = nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if (dict) {
            
            self.title = dict[@"title"];
            self.detail = dict[@"detail"];
            self.imageUrl = dict[@"imageUrl"];
            self.url = dict[@"url"];
            NSDictionary *userInfoDict = dict[@"userInfo"];
            [self decodeUserInfo:userInfoDict];
        }
    }
}

// 会话列表中显示的摘要
- (NSString *)conversationDigest {
    return self.title;
}

// 消息的类型名
+ (NSString *)getObjectName {
    return SHRCRecommendMessageTypeIdentifier;
}

@end
