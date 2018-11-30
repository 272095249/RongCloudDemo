//
//  HeaderView.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/30.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "HeaderView.h"
#import <UIImageView+WebCache.h>

@interface HeaderView ()

@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *idLabel;

@end

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.backgroundColor = [UIColor grayColor];
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
    
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 25, 50, 50)];
    [self addSubview:self.headerImageView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxY(self.headerImageView.frame) + 20, 25, 200, 20)];
    [self addSubview:self.titleLabel];
    
    self.idLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame) + 5, 200, 20)];
    [self addSubview:self.idLabel];
    
}

- (void)setModel:(RCUserInfo *)model {
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:model.portraitUri] placeholderImage:[UIImage imageNamed:@"avatar_users_72px_1108447_easyicon.net"]];
    self.titleLabel.text = model.name;
    self.idLabel.text = model.userId;
}

@end
