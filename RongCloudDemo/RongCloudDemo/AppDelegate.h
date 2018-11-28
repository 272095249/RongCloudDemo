//
//  AppDelegate.h
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/27.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootTabBarController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) RootTabBarController *tabbarVC;

@end

