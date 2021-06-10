//
//  SHExpressionTab.h
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/30.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RongCloudOpenSource/RongIMKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHExpressionTab : NSObject <RCEmoticonTabSource>

/*!
 
 表情tab的标识符
 
 @return 表情tab的标识符，请勿重复
 
 */
@property(nonatomic, strong) NSString *identify;

/*!
 
 表情tab的图标
 
 @return 表情tab的图标
 
 */
@property(nonatomic, strong) UIImage *image;

/*!
 
 表情tab的页数
 
 @return 表情tab的页数
 
 */
@property(nonatomic, assign) int pageCount;

/*!
 
 表情tab的index页的表情View
 
 
 
 @return 表情tab的index页的表情View
 
 @discussion 返回的 view 大小必须等于 contentViewSize （宽度 = 屏幕宽度，高度 =
 
 186）
 
 */
- (UIView *)loadEmoticonView:(NSString *)identify index:(int)index;

@end

NS_ASSUME_NONNULL_END
