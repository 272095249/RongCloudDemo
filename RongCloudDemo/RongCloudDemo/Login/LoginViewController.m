//
//  LoginViewController.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/28.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "LoginViewController.h"
#import <RongIMKit/RongIMKit.h>
#import "UserService.h"
#import <UIImageView+WebCache.h>
#import "RootTabBarController.h"
#import "UserViewController.h"

@interface LoginViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *tokenArray;

@end

static NSString *loginCellID = @"LoginCellID";
@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorColor = [UIColor whiteColor];
    self.tableView.userInteractionEnabled = YES;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:loginCellID];
    
    self.tokenArray = @[
                        @"17ivLw3EAVyeLFAnYd/IQ+vsMfT7dGGVbjDYCJIhAZ5bJDQZdxBxbSGI4wW+sYcNGKt/zjaO9+bcljxYoWT7ckFykiY7cDrl",
                        @"uPUAfBz6PxLUc+SXWKC5GP4OQSvLWK4YEBdyxsEdTU6dpkGJUv1T5Y8lxJjRgPyi2DjiXd4OenokhUFgsdZ4H2KconUDuCE5",
                        @"n41FO6r8LfdPoH9zX64R5evsMfT7dGGVbjDYCJIhAZ5bJDQZdxBxbewnMCcMFj076FeXfwSVNw3cljxYoWT7crM5sV6KOF17",
                        @"2aQAkd0uC8HM40Mxa7+/aOvsMfT7dGGVbjDYCJIhAZ5bJDQZdxBxbTYHJ84BSHx3H+EcmG8rYIjcljxYoWT7coX+dhYbCQGe",
                        @"ExKoqNwkPulBBeBPw0NNWv4OQSvLWK4YEBdyxsEdTU6dpkGJUv1T5cyGVYF1wHGITt+rjBNlgqckhUFgsdZ4Hz5J3+8HSjyX",
                        @"8Ev7sN+uHxBXZmRi31xCNvgUTkdiZNaA33yXO4wh6/E2MnxmnoqDhd/AOU3eZ+sx8FegHcQRlVXiJwxr2b1Znim7pJvKYCi5",
                        @"eHY33Prgfqae0RiFVJKir/4OQSvLWK4YEBdyxsEdTU6dpkGJUv1T5dIs6t7mcccR6R0foFv9NCwkhUFgsdZ4H4WxXt5ymx7u"
                        ];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[UserService share] contacts].count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:loginCellID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:loginCellID];
    }
    
    RCUserInfo * userInfo = [[UserService share] contacts][indexPath.row];
    cell.textLabel.text = userInfo.name;
    cell.detailTextLabel.text = userInfo.userId;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:userInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"avatar_users_72px_1108447_easyicon.net"]];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 连接服务器
    [[RCIM sharedRCIM] connectWithToken:self.tokenArray[indexPath.row] success:^(NSString *userId) {
        // 此处可更改为根据userID取userInfo
        [[UserService share] getUserInfoWithUserId:userId completion:^(RCUserInfo * _Nonnull userInfo) {
            // 当前用户的信息
            [RCIM sharedRCIM].currentUserInfo = userInfo;
            // 是否开启消息撤回
            [RCIM sharedRCIM].enableMessageRecall = YES;
            // 是否开启发送输入状态
            [RCIM sharedRCIM].enableTypingStatus = YES;
            dispatch_async(dispatch_get_main_queue(), ^{
                RootTabBarController *vc = [[RootTabBarController alloc] init];
                [UIApplication sharedApplication].keyWindow.rootViewController = vc;
            });
        }];
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
        
    } error:^(RCConnectErrorCode status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            RootTabBarController *vc = [[RootTabBarController alloc] init];
            [UIApplication sharedApplication].keyWindow.rootViewController = vc;
            NSLog(@"登陆的错误码为:%ld", (long)status);
        });
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
    
}

@end
