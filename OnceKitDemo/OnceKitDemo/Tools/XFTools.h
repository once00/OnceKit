//
//  XFTools.h
//  帝友系统V5
//
//  Created by lxf on 2017/2/9.
//  Copyright © 2017年 wayne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XFTools : NSObject
+ (BOOL)isNilWithStr:(NSString *)str alertStr:(NSString *)remindStr;
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;
+(void)showAlertWithMessage:(NSString *)message;


+ (NSString *)dateForDateStr:(NSString *)dateStr andFormatter:(NSString *)formatter;
+ (NSString *)dateForDateStrfuncell:(NSString *)dateStr andFormatter:(NSString *)formatter;
+ (NSString *)dateForDateStrfuncell:(NSString *)dateStr andFormatter:(NSString *)formatter returnFormatter:(NSString *)returnFormatter;
+ (NSString *)dateForDoubleDateStrfuncell:(double)dateStr andFormatter:(NSString *)formatter returnFormatter:(NSString *)returnFormatter;

#pragma mark - 将某个时间戳转化成 时间
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;

#pragma mark - 获取当前时间的 时间戳
+(NSInteger)getNowTimestamp;

#pragma mark - 将某个时间转化成 时间戳
+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;


+ (NSString *)getText:(NSString *)text withRepeat:(int)repeat;

//拨打电话
+ (void)callWithWithOutRemindAndNumber:(NSString *)number;

@end
