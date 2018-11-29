//
//  SHWebMessageCell.h
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/29.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHWebMessageCell : RCMessageCell

@property (nonatomic, strong) UIImageView *bgView;

@property (nonatomic, strong) UIImageView *picImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *detailLabel;

@end

NS_ASSUME_NONNULL_END
