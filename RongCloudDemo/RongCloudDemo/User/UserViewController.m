//
//  UserViewController.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/30.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "UserViewController.h"
#import "HeaderView.h"
#import "LoginViewController.h"

@interface UserViewController ()

@property (nonatomic, strong) HeaderView *headerView;
@property (nonatomic, strong) UIButton *logoutBtn;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    self.headerView.model = [RCIM sharedRCIM].currentUserInfo;
    
}


- (void)setupUI {
    self.headerView = [[HeaderView alloc] initWithFrame:CGRectMake(5, [UIApplication sharedApplication].statusBarFrame.size.height + 64 + 5, self.view.frame.size.width - 10, 100)];
    [self.view addSubview:self.headerView];
    
    self.logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.logoutBtn.frame = CGRectMake(5, CGRectGetMaxY(self.headerView.frame) + 40, self.view.frame.size.width - 10, 40);
    self.logoutBtn.layer.borderWidth = 0.5;
    self.logoutBtn.layer.cornerRadius = 4;
    self.logoutBtn.layer.masksToBounds = YES;
    [self.logoutBtn setTitle:@"退出" forState:UIControlStateNormal];
    [self.logoutBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.logoutBtn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.logoutBtn];
}

- (void)logout {
    [[RCIM sharedRCIM] logout];
    
    LoginViewController *vc = [LoginViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
    NSLog(@"退出");
}

@end
