//
//  UITextField+Once.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemOnce.h"

@interface UITextField (Once)
/**
 *  大小,键盘模式,提示语,提示语大小,提示语颜色,字体颜色,字体大小,字体位置
 *  @param  frame    大小
 *  @param  borderStyle    键盘模式
 *  @param  placeholderString    提示语
 *  @param  placeFont   提示语大小
 *  @param  placeholderColor    提示语颜色
 *  @param  textColor    字体颜色
 *  @param  textFont    字体大小
 *  @param  alignment    字体位置
 */
+(UITextField*)textFieldWithFrame:(TCGRect)frame
                     keyboardType:(UITextBorderStyle)borderStyle
                placeholderString:(NSString*)placeholderString
            placeholderStringFont:(CGFloat)placeFont
                 placeholderColor:(UIColor*)placeholderColor
                        textColor:(UIColor*)textColor
                         textFont:(CGFloat)textFont
                    textAlignment:(NSTextAlignment)alignment;
@end
