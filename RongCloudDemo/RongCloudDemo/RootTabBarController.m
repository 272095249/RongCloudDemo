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
#import "SHDiscussionListViewController.h"
#import "SHGroupListViewController.h"
#import "UserService.h"
#import "Login/LoginViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *controllers = @[@"SHConversationListViewController", @"SHContactsListViewController", @"SHDiscussionListViewController", @"SHGroupListViewController"];
    NSArray *titles = @[@"消息", @"联系人", @"讨论组", @"群组"];
    NSArray *images = @[@"消息", @"联系人", @"讨论组", @"群"];
    
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
    
//    if (![[UserService share] isLogin]) {
//        [self presentViewController:[LoginViewController new] animated:true completion:nil];
//    }
    
}

@end
