//
//  UIButton+Once.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemOnce.h"

typedef NS_ENUM(NSInteger, CDMImagePosition) {
    CDMImagePositionLeft = 0,              //图片在左，文字在右，默认
    CDMImagePositionRight = 1,             //图片在右，文字在左
    CDMImagePositionTop = 2,               //图片在上，文字在下
    CDMImagePositionBottom = 3,            //图片在下，文字在上
};

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

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)setImagePosition:(CDMImagePosition)postion spacing:(CGFloat)spacing;

@end
