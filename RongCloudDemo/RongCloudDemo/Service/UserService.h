//
//  UserService.h
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/28.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RongIMKit/RongIMKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface UserService : NSObject<RCIMUserInfoDataSource, RCIMGroupInfoDataSource, RCIMGroupMemberDataSource>

+ (UserService *)share;


/*!
 获取用户信息
 @param userId                  用户ID
 @param completion              获取用户信息完成之后需要执行的Block
 @param userInfo(in completion) 该用户ID对应的用户信息
 @discussion SDK通过此方法获取用户信息并显示，请在completion中返回该用户ID对应的用户信息。
 在您设置了用户信息提供者之后，SDK在需要显示用户信息的时候，会调用此方法，向您请求用户信息用于显示。
 */
- (void)getUserInfoWithUserId:(NSString *)userId
                   completion:(void (^)(RCUserInfo *userInfo))completion;

/*!
 获取群组信息
 
 @param groupId                     群组ID
 @param completion                  获取群组信息完成之后需要执行的Block
 @param groupInfo(in completion)    该群组ID对应的群组信息
 @discussion SDK通过此方法获取群组信息并显示，请在completion的block中返回该用户ID对应的群组信息。
 在您设置了群组信息提供者之后，SDK在需要显示群组信息的时候，会调用此方法，向您请求群组信息用于显示。
 */
- (void)getGroupInfoWithGroupId:(NSString *)groupId
                     completion:(void (^)(RCGroup *groupInfo))completion;


- (NSArray *)contacts;

- (NSArray *)groups;

- (BOOL)isLogin;

@end

NS_ASSUME_NONNULL_END
