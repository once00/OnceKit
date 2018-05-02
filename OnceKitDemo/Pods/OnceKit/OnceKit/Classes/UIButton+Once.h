//
//  UIButton+Once.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemOnce.h"

@interface UIButton (Once)
/**
 *  标题,标题颜色,标题大小,标题圆角,控件背景颜色,点击的背景颜色,边框线宽度,点击方法
 *  @param  title    标题
 *  @param  titleColor    标题颜色
 *  @param  font    标题大小
 *  @param  cornerRadiu    标题圆角
 *  @param  backGroundColor    控件背景颜色
 */
+(UIButton *)buttonWithnormalTitle:(NSString *)title
            normalTitleColor:(UIColor *)titleColor
            normalTiltleFont:(CGFloat)font
                 cornerRadiu:(CGFloat)cornerRadiu
             backGroundColor:(UIColor*)backGroundColor
                   backSelectGroundColor:(UIColor*)backSelectGroundColor
                   BorderWidth:(float)width
                       BorderColor:(UIColor*)bordercolor
                      target:(id)target selector:(SEL)selector;

/**
 *  大小,标题,标题颜色,标题大小,标题圆角,控件背景颜色
 *  @param  title    标题
 *  @param  titleColor    标题颜色
 *  @param  font    标题大小
 *  @param  cornerRadiu    标题圆角
 *  @param  backGroundColor    控件背景颜色
 */
+(UIButton *)buttonWithFrame:(TCGRect)frame
                 normalTitle:(NSString *)title
            normalTitleColor:(UIColor *)titleColor
            normalTiltleFont:(CGFloat)font
                 cornerRadiu:(CGFloat)cornerRadiu
             backGroundColor:(UIColor*)backGroundColor
                      target:(id)target selector:(SEL)selector;

/**
 *  大小,标题,标题颜色,标题大小,标题圆角,控件背景颜色,控件点击背景颜色
 *  @param  title    标题
 *  @param  titleColor    标题颜色
 *  @param  font    标题大小
 *  @param  cornerRadiu    标题圆角
 *  @param  backGroundColor    控件背景颜色
 *  @param  selectedGroundColor    控件点击背景颜色
 */
+(UIButton *)buttonWithFrame:(TCGRect)frame
                 normalTitle:(NSString *)title
            normalTitleColor:(UIColor *)titleColor
            normalTiltleFont:(CGFloat)font
                 cornerRadiu:(CGFloat)cornerRadiu
         selectedGroundColor:(UIColor*)selectedGroundColor
             backGroundColor:(UIColor*)backGroundColor
                      target:(id)target selector:(SEL)selector;

/**
 *  大小,背景图片,点击方法
 *  @param  backgroundImageName    控件背景图片
 */
+(UIButton *)buttonWithFrame:(TCGRect)frame
         BackgroundImageName:(NSString *)backgroundImageName
                      target:(id)target selector:(SEL)selector;

/**
 *  大小,背景颜色,点击方法
 *  @param  backgroundImageName    控件背景图片
 */
+(UIButton *)buttonWithFrame:(TCGRect)frame
         backGroundColor:(UIColor *)backGroundColor
                      target:(id)target selector:(SEL)selector;
@end
