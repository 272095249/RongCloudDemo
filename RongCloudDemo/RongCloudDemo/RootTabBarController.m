//
//  RootTabBarController.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/28.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "RootTabBarController.h"
#import "SHContactsListViewController.h"
#import "SHConversationListViewController.h"
#import "SHGroupListViewController.h"
#import "UserService.h"
#import "Login/LoginViewController.h"
#import "User/UserViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *controllers = @[@"SHConversationListViewController", @"SHContactsListViewController", @"SHGroupListViewController", @"UserViewController"];
    NSArray *titles = @[@"消息", @"联系人", @"群组/聊天室", @"个人"];
    NSArray *images = @[@"消息", @"联系人", @"群", @"个人中心"];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:controllers.count];
    
    for (int i = 0; i < controllers.count; i ++) {
        Class class = NSClassFromString(controllers[i]);
        UIViewController *vc = [[class alloc] init];
        vc.title = titles[i];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        UIImage *image = [UIImage imageNamed:images[i]];
        nav.tabBarItem.image = image;
        
        [array addObject:nav];
    }
    
    self.viewControllers = array;
    
   // 注册接收到消息的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMessage) name:@"receiveMessage" object:nil];
}

// 设置tabbar角标
- (void)receiveMessage {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSInteger unreadMsgCount = (NSInteger)[[RCIMClient sharedRCIMClient] getUnreadCount:@[@(ConversationType_PRIVATE),@(ConversationType_GROUP)]];
        
        UINavigationController  *chatNav = self.viewControllers[0];
        if (unreadMsgCount == 0) {
            chatNav.tabBarItem.badgeValue = nil;
        }else{
            chatNav.tabBarItem.badgeValue = [NSString stringWithFormat:@"%li",(long)unreadMsgCount];
        }
    });
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"receiveMessage" object:nil];
}

@end
