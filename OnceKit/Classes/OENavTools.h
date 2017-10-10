//
//  OENavTools.h
//  西北招商网云管理系统
//
//  Created by 曹绍奇 on 2017/10/9.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//
//导航栏相关扩展
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OENavTools : NSObject

/**
 *  带有左右两个按钮的返回
 *  @param  vw    当前是那个vc
 *  @param  imgL    左边按钮图片
 *  @param  imgR    右边按钮图片
 */
+ (void)NavBackButtonLeftOrRight:(UIViewController *)vw leftImg:(NSString *)imgL rigthImg:(NSString *)imgR;

/**
 *  带有左边一个返回按钮的返回
 *  @param  imgL    左边按钮图片
 */
+(void)NavBackButtonLeft:(UIViewController *)vw leftImg:(NSString *)imgL;


@end
