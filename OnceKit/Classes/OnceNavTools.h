//
//  OnceNavTools.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OnceNavTools : NSObject

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


/**
 *  带有右边按钮的
 *  @param  imgL    左边按钮图片
 */
+(void)NavBackButtonRight:(UIViewController *)vw RightImg:(NSString *)imgL;

@end
