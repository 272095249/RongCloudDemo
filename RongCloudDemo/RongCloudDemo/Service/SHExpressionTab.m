//
//  SHExpressionTab.m
//  RongCloudDemo
//
//  Created by 孙浩 on 2018/11/30.
//  Copyright © 2018 孙浩. All rights reserved.
//

#import "SHExpressionTab.h"

@implementation SHExpressionTab

- (UIView *)loadEmoticonView:(NSString *)identify index:(int)index {
    
    UIView *view = [[UIView alloc]
                    
                    initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 186)];
    
    view.backgroundColor = [UIColor redColor];
    
    switch (index) {
            
        case 1:
            view.backgroundColor = [UIColor yellowColor];
            break;
        case 2:
            view.backgroundColor = [UIColor blueColor];
            break;
        case 3:
            view.backgroundColor = [UIColor greenColor];
            break;
        case 4:
            view.backgroundColor = [UIColor grayColor];
            break;
        default:
            view.backgroundColor = [UIColor clearColor];
            break;
    }
    NSLog(@"------------------ index:%d",index);
    
    return view;
    
}



@end
