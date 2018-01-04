//
//  UILabel+Once.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemOnce.h"

@interface UILabel (Once)

/**
 *  内容,字体颜色,字体大小,字体位置,是否N行自适应
 *  @param  text    内容
 *  @param  font    字体大小
 *  @param  textColor    字体颜色
 *  @param  alignment    字体位置
 *  @param  Lines    是否N行自适应
 */
+(UILabel*)labelWithText:(NSString*)text
                 textFont:(CGFloat)font
                textColor:(UIColor*)textColor
            TextAlignment:(NSTextAlignment)alignment
            numberOfLines:(BOOL)Lines;

/**
 *  大小,内容,字体颜色,字体大小,字体位置,是否N行自适应
 *  @param  frame    大小
 *  @param  text    内容
 *  @param  font    字体大小
 *  @param  textColor    字体颜色
 *  @param  alignment    字体位置
 *  @param  Lines    是否N行自适应
 */
+(UILabel*)labelWithFrame:(TCGRect)frame
                     text:(NSString*)text
                 textFont:(CGFloat)font
                textColor:(UIColor*)textColor
            TextAlignment:(NSTextAlignment)alignment
            numberOfLines:(BOOL)Lines;

/**
 *  大小,内容,字体颜色,字体大小,字体位置,一行长度自适应
 *  @param  frame    大小
 *  @param  text    内容
 *  @param  font    字体大小
 *  @param  textColor    字体颜色
 *  @param  alignment    字体位置
 *  @param  Lines    是否N行自适应
 */
+(UILabel*)labelWithFrame:(TCGRect)frame
                     text:(NSString*)text
                 textFont:(CGFloat)font
                textColor:(UIColor*)textColor
            TextAlignment:(NSTextAlignment)alignment
            WithTitle:(BOOL)Lines;


/**
 *  大小,内容,字体颜色,字体大小,行间距,字间距,字体位置(默认自动换行)
 *  @param  frame    大小
 *  @param  text    内容
 *  @param  font    字体大小
 *  @param  textColor    字体颜色
 *  @param  alignment    字体位置
 *  @param  lineSpace    行间距
 *  @param  wordSpace    字间距
 */
+(UILabel*)labelWithFrame:(TCGRect)frame
                     text:(NSString*)text
                 textFont:(CGFloat)font
                textColor:(UIColor*)textColor
            TextAlignment:(NSTextAlignment)alignment
            withLineSpace:(float)lineSpace
                WordSpace:(float)wordSpace;

/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

@end
