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


@interface UserService : NSObject

+ (UserService *)share;

- (RCUserInfo *)currentUser;

- (NSArray *)contacts;

@end

NS_ASSUME_NONNULL_END
