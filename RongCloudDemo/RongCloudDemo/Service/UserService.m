//
//  UserService.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/28.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "UserService.h"
#import <RongIMKit/RongIMKit.h>

@implementation UserService

- (instancetype)init{
    if (self = [super init]) {
        [RCIM sharedRCIM].userInfoDataSource = self;
        [RCIM sharedRCIM].groupInfoDataSource = self;
    }
    return self;
}

+ (UserService *)share {
    
    static UserService *userService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userService = [[[self class] alloc] init];
    });
    return userService;
}

- (BOOL)isLogin {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"];
}

- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo * _Nonnull))completion {
    for (RCUserInfo *userInfo in [self contacts]) {
        if ([userInfo.userId isEqualToString:userId]) {
            completion(userInfo);
        }
    }
}

- (void)getGroupInfoWithGroupId:(NSString *)groupId completion:(void (^)(RCGroup * _Nonnull))completion {
    for (RCGroup *group in [self groups]) {
        if ([group.groupId isEqualToString:groupId]) {
            completion(group);
        }
    }
}

- (NSArray *)groups {
    RCGroup *group1 = [[RCGroup alloc] initWithGroupId:@"123456" groupName:@"测试群组1" portraitUri:@"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRibEL1kI-m0Aa-VJG_zSJnJD961Q4rQor-UWxjqqdlwRU5TNvx"];
    RCGroup *group2 = [[RCGroup alloc] initWithGroupId:@"123457" groupName:@"测试群组2" portraitUri:@"http://www.tmdqq.com/uploads/allimg/c170228/14X26444503M0-V3V6.jpg"];
    RCGroup *group3 = [[RCGroup alloc] initWithGroupId:@"123458" groupName:@"测试群组3" portraitUri:@"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9gf_z9HNr8xU0TQgX6Yr7w1gWpUSu0_H_MdgevPHcgocMQcaO"];
    return @[group1, group2, group3];
}

- (NSArray *)contacts {
    
    RCUserInfo *test1 = [[RCUserInfo alloc] initWithUserId:@"15510269373" name:@"测试1" portrait:@"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3V3syhfNxqsgdHHErx2saO5zTryNnux0NHQFpNOXFqg3XigXK"];
    RCUserInfo *test2 = [[RCUserInfo alloc] initWithUserId:@"15510269374" name:@"测试2" portrait:@"http://pic1.win4000.com/pic/8/d9/b5d630a006.jpg?down"];
    RCUserInfo *test3 = [[RCUserInfo alloc] initWithUserId:@"15510269375" name:@"测试3" portrait:@"http://www.ghost64.com/qqtupian/zixunImg/local/2018/07/16/15317460421057.jpeg"];
    RCUserInfo *test4 = [[RCUserInfo alloc] initWithUserId:@"15510269376" name:@"测试4" portrait:@"http://pic.paopaoche.net/up/2016-12/14809216418921248.jpg"];
    RCUserInfo *test5 = [[RCUserInfo alloc] initWithUserId:@"15510269377" name:@"测试5" portrait:@"https://pic.qqtn.com/up/2018-5/15252271245423063.jpg"];
    RCUserInfo *testHarrySun = [[RCUserInfo alloc] initWithUserId:@"15510269371" name:@"HarrySun" portrait:@"https://www.kuk8.com/uploads/allimg/170916/1-1F91214235H54.jpg"];
    RCUserInfo *test007 = [[RCUserInfo alloc] initWithUserId:@"15510269372" name:@"007" portrait:@"https://www.ld12.com/upimg358/allimg/20170126/32figm3hl2u274.jpg"];
    
    return @[test1, test2, test3, test4, test5, testHarrySun, test007];
}

@end
