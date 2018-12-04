//
//  AppDelegate.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/27.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "AppDelegate.h"
#import "RootTabBarController.h"
#import "UserService.h"
#import "SHMessageContent.h"
#import "Login/LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    LoginViewController *vc = [LoginViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.tabbarVC = [[RootTabBarController alloc] init];
    self.window.rootViewController = nav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self initRongCloud];
    
    // 请求推送权限
    if ([application
         respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        // 注册推送, 用于iOS8以及iOS8之后的系统
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert) categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    
    // 远程推送的内容
    NSDictionary *remoteNotificationUserInfo = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
    NSLog(@"%@", remoteNotificationUserInfo);
    
    return YES;
}

// 注册用户通知设置
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [application registerForRemoteNotifications];
}

// 设置deviceToken
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // deviceToken
    NSString *token =
    [[[[deviceToken description] stringByReplacingOccurrencesOfString:@"<" withString:@""] stringByReplacingOccurrencesOfString:@">" withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    [[RCIMClient sharedRCIMClient] setDeviceToken:token];
}

- (void)initRongCloud {
    // 初始化
    [[RCIM sharedRCIM] initWithAppKey:@"z3v5yqkbz1yc0"];
    
    
    [RCIM sharedRCIM].globalNavigationBarTintColor = UIColor.blueColor;
    // 将连接服务器更改到login
    // 连接服务器
    // HarrySun -- 8Ev7sN+uHxBXZmRi31xCNvgUTkdiZNaA33yXO4wh6/E2MnxmnoqDhd/AOU3eZ+sx8FegHcQRlVXiJwxr2b1Znim7pJvKYCi5
    // 17ivLw3EAVyeLFAnYd/IQ+vsMfT7dGGVbjDYCJIhAZ5bJDQZdxBxbSGI4wW+sYcNGKt/zjaO9+bcljxYoWT7ckFykiY7cDrl
//    [[RCIM sharedRCIM] connectWithToken:@"17ivLw3EAVyeLFAnYd/IQ+vsMfT7dGGVbjDYCJIhAZ5bJDQZdxBxbSGI4wW+sYcNGKt/zjaO9+bcljxYoWT7ckFykiY7cDrl" success:^(NSString *userId) {
//        [[UserService share] getUserInfoWithUserId:userId completion:^(RCUserInfo * _Nonnull userInfo) {
//            // 当前用户的信息
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [RCIM sharedRCIM].currentUserInfo = userInfo;
//                [RCIM sharedRCIM].enableMessageRecall = YES;
//                [RCIM sharedRCIM].enableTypingStatus = YES;
//            });
//        }];
//        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
//    } error:^(RCConnectErrorCode status) {
//        NSLog(@"登陆的错误码为:%ld", (long)status);
//    } tokenIncorrect:^{
//        //token过期或者不正确。
//        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
//        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
//        NSLog(@"token错误");
//    }];
    
    // 设置后显示好友信息
    [RCIM sharedRCIM].userInfoDataSource = [UserService share];
    [RCIM sharedRCIM].groupInfoDataSource = [UserService share];
    
    // 设置消息接收的delegate
    [RCIM sharedRCIM].receiveMessageDelegate = self;
    
    // 设置发送已读回执的会话类型
    [RCIM sharedRCIM].enabledReadReceiptConversationTypeList = @[@(ConversationType_PRIVATE), @(ConversationType_GROUP) ];
    
    // 注册该自定义消息类：只有注册了该消息类型之后，SDK 才能识别和编码、解码该类型的消息。
    [[RCIM sharedRCIM] registerMessageType:SHMessageContent.class];
}

// 接收消息回调
- (void)onRCIMReceiveMessage:(RCMessage *)message left:(int)left {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"receiveMessage" object:self];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
