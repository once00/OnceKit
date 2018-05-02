//
//  UIView+OnceLayout.m
//  OnceLayoutDemo
//
//  Created by 曹绍奇 on 2018/4/9.
//  Copyright © 2018年 Once. All rights reserved.
//

#import "UIView+OnceLayout.h"

@implementation UIView (OnceLayout)


- (CGSize)once_size;
{
    return [self frame].size;
}

- (void)setOnce_size:(CGSize)once_size;
{
    CGPoint origin = [self frame].origin;
    [self setFrame:CGRectMake(origin.x, origin.y, once_size.width, once_size.height)];
}

-(CGFloat)once_x{
    CGRect frame=[self frame];
    return frame.origin.x;
}

-(void)setOnce_x:(CGFloat)once_x{
    CGRect frame=[self frame];
    frame.origin.x=once_x;
    [self setFrame:frame];
}

-(CGFloat)once_y{
    CGRect frame=[self frame];
    return frame.origin.y;
}

-(void)setOnce_y:(CGFloat)once_y{
    CGRect frame=[self frame];
    frame.origin.y=once_y;
    return [self setFrame:frame];
}

- (CGFloat)once_left;
{
    return CGRectGetMinX([self frame]);
}

- (void)setOnce_left:(CGFloat)x;
{
    CGRect frame = [self frame];
    frame.origin.x = x;
    [self setFrame:frame];
}

- (CGFloat)once_top;
{
    return CGRectGetMinY([self frame]);
}

- (void)setOnce_top:(CGFloat)y;
{
    CGRect frame = [self frame];
    frame.origin.y = y;
    [self setFrame:frame];
}

- (CGFloat)once_right;
{
    return CGRectGetMaxX([self frame]);
}
- (void)setOnce_right:(CGFloat)once_right{
    CGRect frame = [self frame];
    
    frame.origin.x=CGRectGetWidth(self.superview.frame) - CGRectGetWidth(frame) - once_right;
    
    [self setFrame:frame];
}

- (CGFloat)once_bottom;
{
    return CGRectGetMaxY([self frame]);
}

- (void)setOnce_bottom:(CGFloat)once_bottom;
{
    CGRect frame = [self frame];
    frame.origin.y = once_bottom - frame.size.height;
    [self setFrame:frame];
}

- (CGFloat)once_centerX;
{
    return [self center].x;
}

- (void)setOnce_centerX:(CGFloat)centerX;
{
    [self setCenter:CGPointMake(centerX, self.center.y)];
}

- (CGFloat)once_centerY;
{
    return [self center].y;
}

- (void)setOnce_centerY:(CGFloat)once_centerY;
{
    [self setCenter:CGPointMake(self.center.x, once_centerY)];
}

- (CGFloat)once_width;
{
    return CGRectGetWidth([self frame]);
}

- (void)setOnce_width:(CGFloat)once_width;
{
    CGRect frame = [self frame];
    frame.size.width = once_width;
    [self setFrame:CGRectStandardize(frame)];
}

- (CGFloat)once_height;
{
    return CGRectGetHeight([self frame]);
}

- (void)setOnce_height:(CGFloat)once_height;
{
    CGRect frame=[self frame];
    frame.size.height = once_height;
    [self setFrame:CGRectStandardize(frame)];
}














- (MarginToView)once_rightToView{
    __weak typeof(self) weakSelf = self;
    return ^(id viewOrView , CGFloat value) {
        CGRect frame = [self frame];
        if ([viewOrView isKindOfClass:[UIView class]]) {
            
            UIView * marginview=viewOrView;
            if ([self isDescendantOfView:marginview]) {
                NSLog(@"已添加上");
                frame.origin.x=CGRectGetWidth(marginview.frame) - CGRectGetWidth([self frame]) - value;
            }else{
                frame.origin.x=CGRectGetMinX(marginview.frame) - CGRectGetWidth([self frame]) - value;
            }
        }
        [self setFrame:frame];
        
        return weakSelf;
    };
}

-(MarginToView)once_leftToView{
    __weak typeof(self) weakSelf = self;
    return ^(id viewOrView , CGFloat value) {
        CGRect frame = [self frame];
        if ([viewOrView isKindOfClass:[UIView class]]) {
            
            UIView * marginview=viewOrView;
            if ([self isDescendantOfView:marginview]) {
                NSLog(@"已添加上");
                frame.origin.x=value;
            }else{
                frame.origin.x=value;
//                frame.origin.x=CGRectGetMaxX(marginview.frame) + value;
            }
        }
        [self setFrame:frame];
        
        return weakSelf;
    };
}

-(MarginToView)once_topToView{
    __weak typeof(self) weakSelf = self;
    return ^(id viewOrView , CGFloat value) {
        CGRect frame = [self frame];
        if ([viewOrView isKindOfClass:[UIView class]]) {
            
            UIView * marginview=viewOrView;
            if ([self isDescendantOfView:marginview]) {
                NSLog(@"已添加上");
                frame.origin.y=value;
            }else{
                frame.origin.y=CGRectGetMaxY(marginview.frame) + value;
            }
        }
        [self setFrame:frame];
        
        return weakSelf;
    };
}

-(MarginToView)once_bottomToView{
    __weak typeof(self) weakSelf = self;
    return ^(id viewOrView , CGFloat value) {
        CGRect frame = [self frame];
        if ([viewOrView isKindOfClass:[UIView class]]) {
            
            UIView * marginview=viewOrView;
            if ([self isDescendantOfView:marginview]) {
                NSLog(@"已添加上");
                frame.origin.y=CGRectGetHeight(marginview.frame) - CGRectGetHeight([self frame]) - value;
            }else{
                frame.origin.y=CGRectGetMinY(marginview.frame) - CGRectGetHeight([self frame])  - value;
            }
        }
        [self setFrame:frame];
        
        return weakSelf;
    };
}




/** 本身的宽度  */
-(CGFloat)max_width{
    return CGRectGetWidth([self frame]);
}
/** 本身的高度  */
-(CGFloat)max_height{
    return CGRectGetHeight([self frame]);
}
/** 顶部的坐标  */
-(CGFloat)max_top{
    return CGRectGetMinY([self frame]);
}
/**右边缘的坐标  */
-(CGFloat)max_right{
    return CGRectGetMaxX([self frame]);
}
/** 底部的坐标  */
-(CGFloat)max_bottom{
    return CGRectGetMaxY([self frame]);
}
/** 左边缘的坐标  */
-(CGFloat)max_left{
    return CGRectGetMinX([self frame]);
}
/** 中心点的X坐标  */
-(CGFloat)max_midx{
    return CGRectGetMidX([self frame]);
}
/** 中心点的Y坐标  */
-(CGFloat)max_midy{
    return CGRectGetMidY([self frame]);
}







@end
