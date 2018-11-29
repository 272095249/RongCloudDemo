//
//  SHMessageContent.h
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/28.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import <RongIMLib/RongIMLib.h>

NS_ASSUME_NONNULL_BEGIN

#define SHRCRecommendMessageTypeIdentifier @"RCD:SHRecommendMsg"

@interface SHMessageContent : RCMessageContent<NSCoding, RCMessageContentView>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *url;

+ (instancetype)messageWithTitle:(NSString *)title detail:(NSString *)detail imageUrl:(NSString *)imageUrl url:(NSString *)url;


@end

NS_ASSUME_NONNULL_END
