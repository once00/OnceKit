//
//  UIView+Once.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemOnce.h"

@interface UIView (Once)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (assign, nonatomic) CGPoint origin;

///< 移除此view上的所有子视图
- (void)removeAllSubviews;


/**
 *  大小,背景颜色
 *  @param  frame    大小
 *  @param  color    背景颜色
 */
+(UIView*)viewWithFrame:(TCGRect)frame
        backGroundColor:(UIColor*)color;

@end
