//
//  OnceTime.h
//  MBProgressHUD
//
//  Created by 曹绍奇 on 2017/10/12.
//

#import <Foundation/Foundation.h>

@interface OnceTime : NSObject

+ (BOOL)isNilWithStr:(NSString *)str alertStr:(NSString *)remindStr;


+ (NSString *)dateForDateStr:(NSString *)dateStr andFormatter:(NSString *)formatter;

+ (NSString *)dateForDateStrfuncell:(NSString *)dateStr andFormatter:(NSString *)formatter;

+ (NSString *)dateForDateStrfuncell:(NSString *)dateStr andFormatter:(NSString *)formatter returnFormatter:(NSString *)returnFormatter;

/**
 *  时间戳转化成 时间
 *
 *  @param dateStr    时间戳
 *  @param formatter    时间格式(yyyyMMddHHmmss)
 *  @param returnFormatter    时间格式(YYYY-MM-dd)
 */
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
