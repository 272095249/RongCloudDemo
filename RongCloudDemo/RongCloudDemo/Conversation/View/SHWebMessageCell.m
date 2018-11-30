//
//  SHWebMessageCell.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/29.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "SHWebMessageCell.h"
#import "SHMessageContent.h"
#import <UIImageView+WebCache.h>

#define kBgWidth 200
#define kBgHeight 90

@implementation SHWebMessageCell
/*!
 自定义消息Cell的Size
 
 @param model               要显示的消息model
 @param collectionViewWidth cell所在的collectionView的宽度
 @param extraHeight         cell内容区域之外的高度
 
 @return 自定义消息Cell的Size
 
 @discussion 当应用自定义消息时，必须实现该方法来返回cell的Size。
 其中，extraHeight是Cell根据界面上下文，需要额外显示的高度（比如时间、用户名的高度等）。
 一般而言，Cell的高度应该是内容显示的高度再加上extraHeight的高度。
 */
+ (CGSize)sizeForMessageModel:(RCMessageModel *)model withCollectionViewWidth:(CGFloat)collectionViewWidth referenceExtraHeight:(CGFloat)extraHeight {
    
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, kBgHeight + extraHeight);
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.bgView = [[UIImageView alloc] init];
    self.bgView.userInteractionEnabled = YES;
    [self.messageContentView addSubview:self.bgView];
    
    self.picImageView = [[UIImageView alloc] init];
    self.picImageView.userInteractionEnabled = YES;
    [self.bgView addSubview:self.picImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor redColor];
    [self.bgView addSubview:self.titleLabel];
    
    self.detailLabel = [[UILabel alloc] init];
    self.detailLabel.textColor = [UIColor grayColor];
    [self.bgView addSubview:self.detailLabel];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    tap.numberOfTapsRequired = 1;
    [self.bgView addGestureRecognizer:tap];
    
    UILongPressGestureRecognizer *longGes = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longAction:)];
    [self.bgView addGestureRecognizer:longGes];
}

- (void)setDataModel:(RCMessageModel *)model {
    [super setDataModel:model];
    [self updateUI];
}

- (void)updateUI {

    SHMessageContent *messageContent = (SHMessageContent *)self.model.content;
    if (messageContent) {
        self.titleLabel.text = messageContent.title;
        self.detailLabel.text = messageContent.detail;
        [self.picImageView sd_setImageWithURL:[NSURL URLWithString:messageContent.imageUrl] placeholderImage:[UIImage imageNamed:@"urlPic"]];
    }

    CGSize bgViewSize = CGSizeMake(kBgWidth, kBgHeight);
    // 消息内容View的Rect
    CGRect messageContetViewRect = self.messageContentView.frame;

    if (MessageDirection_RECEIVE == self.messageDirection) { // 接受
        self.picImageView.frame = CGRectMake(20, 5, 70, 70);
        self.titleLabel.frame = CGRectMake(100, 10, 150, 20);
        self.detailLabel.frame = CGRectMake(100, 40, 150, 20);

        messageContetViewRect.size.width = bgViewSize.width;
        messageContetViewRect.size.height = bgViewSize.height;

        self.messageContentView.frame = messageContetViewRect;
        self.bgView.frame = CGRectMake(0, 0, bgViewSize.width, bgViewSize.height);

        UIImage *image = [RCKitUtility imageNamed:@"chat_from_bg_normal" ofBundle:@"RongCloud.bundle"];
        self.bgView.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.8, image.size.width * 0.8, image.size.height * 0.2, image.size.width * 0.2)];
    } else { // 发送
        self.picImageView.frame = CGRectMake(10, 10, 70, 70);
        self.titleLabel.frame = CGRectMake(90, 15, 150, 20);
        self.detailLabel.frame = CGRectMake(90, 45, 150, 20);

        messageContetViewRect.size.width = bgViewSize.width;
        messageContetViewRect.size.height = bgViewSize.height;

        messageContetViewRect.origin.x = self.baseContentView.bounds.size.width - (messageContetViewRect.size.width + HeadAndContentSpacing + [RCIM sharedRCIM].globalMessagePortraitSize.width + 10);

        self.messageContentView.frame = messageContetViewRect;
        self.bgView.frame = CGRectMake(0, 0, bgViewSize.width, bgViewSize.height);

        UIImage *image = [RCKitUtility imageNamed:@"chat_to_bg_normal" ofBundle:@"RongCloud.bundle"];
        self.bgView.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.8, image.size.width * 0.2, image.size.height * 0.2, image.size.width * 0.8)];
    }
}

- (void)tapAction {
    if([self.delegate respondsToSelector:@selector(didTapMessageCell:)])
        [self.delegate didTapMessageCell:self.model];
}

- (void)longAction:(id)sender {
    
    UILongPressGestureRecognizer *press = (UILongPressGestureRecognizer *)sender;
    if (press.state == UIGestureRecognizerStateEnded) {
        return;
    } else if (press.state == UIGestureRecognizerStateBegan) {
        if ([self.delegate respondsToSelector:@selector(didLongTouchMessageCell:inView:)]) {
            [self.delegate didLongTouchMessageCell:self.model inView:self.bgView];
        }
    }
}

@end
