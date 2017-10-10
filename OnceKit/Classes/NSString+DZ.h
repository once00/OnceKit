//
//  NSString+DZ.h
//  当地主
//
//  Created by 曹绍奇 on 15/9/21.
//  Copyright (c) 2015年 曹绍奇. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  判断是否为空字符串
 */
@interface NSString (DZ)

/**
 * 去掉字符串的空格
 */
- (NSString *)trimString;

/**
 * 是否是空字符串
 */
- (BOOL)isEmptyString;

//是否为空字符串
- (BOOL) isBlankString;

//判断是否为url
- (BOOL)isUrl;

@end
