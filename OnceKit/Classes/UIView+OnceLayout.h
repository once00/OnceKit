//
//  UIView+OnceLayout.h
//  OnceLayoutDemo
//
//  Created by 曹绍奇 on 2018/4/9.
//  Copyright © 2018年 Once. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView *(^MarginToView)(id viewOrView , CGFloat value);

@interface UIView (OnceLayout)

@property (nonatomic, assign) CGSize once_size;

@property (nonatomic,assign)  CGFloat once_x;

@property  (nonatomic,assign) CGFloat once_y;

@property (nonatomic, assign) CGFloat once_top;

@property (nonatomic, assign) CGFloat once_bottom;

@property (nonatomic, assign) CGFloat once_left;

@property (nonatomic, assign) CGFloat once_right;

@property (nonatomic, assign) CGFloat once_centerX;

@property (nonatomic, assign) CGFloat once_centerY;

@property (nonatomic, assign) CGFloat once_width;

@property (nonatomic, assign) CGFloat once_height;


/** 右间距与参照view相同，参数为“(View)”  */
@property (nonatomic, copy, readonly) MarginToView once_rightToView;
/** 左间距与参照view相同，参数为“(View)”  */
@property (nonatomic, copy, readonly) MarginToView once_leftToView;
/** 顶部间距与参照view相同，参数为“(View)”  */
@property (nonatomic, copy, readonly) MarginToView once_topToView;
/** 底部间距与参照view相同，参数为“(View)”  */
@property (nonatomic, copy, readonly) MarginToView once_bottomToView;



/** 本身的宽度  */
@property (nonatomic, assign) CGFloat max_width;
/** 本身的高度  */
@property (nonatomic, assign) CGFloat max_height;
/** 顶部的坐标  */
@property (nonatomic, assign) CGFloat max_top;
/** 右边缘的坐标  */
@property (nonatomic, assign) CGFloat max_right;
/** 底部的坐标  */
@property (nonatomic, assign) CGFloat max_bottom;
/** 左边缘的坐标  */
@property (nonatomic, assign) CGFloat max_left;
/** 中心点的X坐标  */
@property (nonatomic, assign) CGFloat max_midx;
/** 中心点的Y坐标  */
@property (nonatomic, assign) CGFloat max_midy;

@end
