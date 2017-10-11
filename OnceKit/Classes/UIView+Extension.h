//
//  InterestsController.m
//  当地主
//
//  Created by 曹绍奇 on 15/9/18.
//  Copyright (c) 2015年 曹绍奇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemOnce.h"

@interface UIView (Extension)
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



+(UIView*)viewWithFrame:(TCGRect)frame
        backGroundColor:(UIColor*)color;

@end
