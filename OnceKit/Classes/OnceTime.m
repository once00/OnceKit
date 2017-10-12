//
//  OnceTime.m
//  MBProgressHUD
//
//  Created by 曹绍奇 on 2017/10/12.
//

#import "OnceTime.h"
#import "OnceCommonMacro.h"

#define FONT_NAME @"HelveticaNeue-Light"
#define NavState_White @"NavState_White"
#define NavState_Green @"NavState_Green"
#define NavState_White_Alpha @"NavState_White_Alpha"
#define GlobalCornerRadius 3
#define Theme_Color11 [OnceTime colorWithHexString:@"#6fa5ff"]
#define A_pixel 1/[UIScreen mainScreen].scale

@interface OnceTime ()<UIAlertViewDelegate>{
    
}

@property (nonatomic, assign) BOOL isShow;

@end

@implementation OnceTime

static   OnceTime* xftools;

+(OnceTime *)shareInstance
{
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!xftools) {
            xftools = [OnceTime new];
            //            shareUser.login = NO;
        }
    });
    return xftools;
    
}



+ (BOOL)isNilWithStr:(NSString *)str alertStr:(NSString *)remindStr{
    
    if ([str isEqualToString:@""]||str == nil||str.length == 0) {
        
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:remindStr delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        
        [alertView show];
        return YES;
    }
    
    return NO;
    
}


+ (NSString *)dateForDateStr:(NSString *)dateStr andFormatter:(NSString *)formatter{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    //    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    inputFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    [inputFormatter setDateFormat:formatter];
    NSDate* inputDate = [inputFormatter dateFromString:dateStr];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:inputDate];
    
    return strDate;
}
+ (NSString *)dateForDateStrfuncell:(NSString *)dateStr andFormatter:(NSString *)formatter{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    inputFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    [inputFormatter setDateFormat:formatter];
    //    NSDate *now = [NSDate date];
    
    //    NSDate *createDate=[NSDate dateWithTimeIntervalSinceNow:[dateStr doubleValue]];
    //        NSDate *createDate=[NSDate dateWithTimeIntervalSinceNow:[dateStr doubleValue]];
    NSDate *createDate=[NSDate dateWithTimeIntervalSince1970:[dateStr doubleValue]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:createDate];
    
    return strDate;
}

+ (NSString *)dateForDateStrfuncell:(NSString *)dateStr andFormatter:(NSString *)formatter returnFormatter:(NSString *)returnFormatter{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    inputFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    [inputFormatter setDateFormat:formatter];
    //    NSDate *now = [NSDate date];
    
    //    NSDate *createDate=[NSDate dateWithTimeIntervalSinceNow:[dateStr doubleValue]];
    //        NSDate *createDate=[NSDate dateWithTimeIntervalSinceNow:[dateStr doubleValue]];
    NSDate *createDate=[NSDate dateWithTimeIntervalSince1970:[dateStr doubleValue]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:returnFormatter];
    NSString *strDate = [dateFormatter stringFromDate:createDate];
    
    return strDate;
}



+ (NSString *)dateForDoubleDateStrfuncell:(double)dateStr andFormatter:(NSString *)formatter returnFormatter:(NSString *)returnFormatter{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    inputFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"];
    [inputFormatter setDateFormat:formatter];
    //    NSDate *now = [NSDate date];
    
    //    NSDate *createDate=[NSDate dateWithTimeIntervalSinceNow:[dateStr doubleValue]];
    //        NSDate *createDate=[NSDate dateWithTimeIntervalSinceNow:[dateStr doubleValue]];
    NSDate *createDate=[NSDate dateWithTimeIntervalSince1970:dateStr ];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:returnFormatter];
    NSString *strDate = [dateFormatter stringFromDate:createDate];
    
    return strDate;
    
}

#pragma mark - 将某个时间戳转化成 时间

+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    //    NSLog(@"1296035591  = %@",confromTimesp);
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    //NSLog(@"&&&&&&&confromTimespStr = : %@",confromTimespStr);
    
    
    return confromTimespStr;
    
}
#pragma mark - 获取当前时间的 时间戳

+(NSInteger)getNowTimestamp{
    
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间
    
    
    
    NSLog(@"设备当前的时间:%@",[formatter stringFromDate:datenow]);
    
    //时间转时间戳的方法:
    
    
    
    NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];
    
    
    
    NSLog(@"设备当前的时间戳:%ld",(long)timeSp); //时间戳的值
    
    
    
    return timeSp;
    
}

#pragma mark - 将某个时间转化成 时间戳

+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    
    
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    
    
    
    NSLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    
    
    
    return timeSp;
    
}



// 重复text字符串repeat次
+ (NSString *)getText:(NSString *)text withRepeat:(int)repeat {
    NSMutableString *tmpText = [NSMutableString new];
    
    for (int i = 0; i < repeat; i++) {
        [tmpText appendString:text];
    }
    
    return tmpText;
}


//拨打电话
+ (void)callWithWithOutRemindAndNumber:(NSString *)number{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",number]];
    if (iOS10 < 10.0) {
        [[UIApplication sharedApplication] openURL:url];
    }else{
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
                
                DDLog(@"打电话");
            }];
        } else {
            // Fallback on earlier versions
        }
    }
    
}

#pragma mark - 颜色相关
//得到HEX域颜色
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert {
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor clearColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor clearColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}
//从图片中获取色彩
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
+ (void)addGradientColorLayer:(UIButton *)btn colors:(NSArray*)colors highlightedColors:(NSArray *)highlightedColors{
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(btn.frame.size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start = CGPointMake(0.0, 0.0);
    CGPoint end = CGPointMake(btn.frame.size.width, 0.0);
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    
    //
    //    NSMutableArray *ar2 = [NSMutableArray array];
    //    for(UIColor *c in highlightedColors) {
    //        [ar2 addObject:(id)c.CGColor];
    //    }
    //    UIGraphicsBeginImageContextWithOptions(btn.frame.size, YES, 1);
    //    CGContextRef context2 = UIGraphicsGetCurrentContext();
    //    CGContextSaveGState(context2);
    //    CGColorSpaceRef colorSpace2 = CGColorGetColorSpace([[highlightedColors lastObject] CGColor]);
    //    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace2, (CFArrayRef)ar2, NULL);
    //    CGPoint start2 = CGPointMake(0.0, 0.0);
    //    CGPoint end2 = CGPointMake(btn.frame.size.width, 0.0);
    //    CGContextDrawLinearGradient(context2, gradient2, start2, end2, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    //    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    //    CGGradientRelease(gradient2);
    //    CGContextRestoreGState(context2);
    //    CGColorSpaceRelease(colorSpace2);
    //    UIGraphicsEndImageContext();
    //    [btn setBackgroundImage:image2 forState:UIControlStateHighlighted];
    //
    //    btn.adjustsImageWhenHighlighted = NO;
    //    btn.tintColor = [UIColor clearColor];
    btn.layer.cornerRadius = GlobalCornerRadius;
    btn.layer.masksToBounds = YES;
    
}
#pragma mark -时间相关
//倒计时更新倒计时label
+ (NSString *)countTimeToString:(NSString *)dateString{
    NSDate * fromDate = [self stringToDate:dateString format:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * sinceDate = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate: sinceDate];
    
    NSDate *localeDate = [sinceDate  dateByAddingTimeInterval: interval];
    
    NSCalendar *cal = [NSCalendar currentCalendar];//定义一个NSCalendar对象
    
    //用来得到具体的时差
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *d = [cal components:unitFlags fromDate:localeDate toDate:fromDate options:0];
    NSString *countdown;
    if ([d second] < 0) {
        //        countdown = presaleFinishString;
        return countdown;
    }
    else {
        //    NSString *countdown = [NSString stringWithFormat:@"%ld日%ld时%ld分", (long)[d day], (long)[d hour], (long)[d minute]];
        //        countdown = [NSString stringWithFormat:presaleDuringString, (long)[d day], (long)[d hour], (long)[d minute],(long)[d second]];
        return countdown;
    }
}
//从时间整型数据的到时间
+ (NSDate *)dateFromLongLong:(NSTimeInterval)msSince1970 {
    return [NSDate dateWithTimeIntervalSince1970:msSince1970];
}
//从时间格式得到时间字符串格式
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:date];
}
//从时间字符串格式得到时间格式
+ (NSDate *)stringToDate:(NSString *)dateString format:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter dateFromString:dateString];
}
//得到符合相应时间格式的当前时间字符串
+ (NSString *)getCurrentTime:(NSString *)timeformat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:timeformat];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}
//计算年龄
+ (NSString *)countAge:(NSString *)birthday {
    if ([@"" isEqualToString:birthday]) {
        return @"0";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd"];
    NSDate *date = [dateFormatter dateFromString:birthday];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    
    int year = (int)[comps year];
    
    NSDate *now = [NSDate date];
    NSDateComponents *nowComps = [calendar components:unitFlags fromDate:now];
    int nowYear = (int)[nowComps year];
    return [NSString stringWithFormat:@"%d", (nowYear - year)];
}
+ (NSString *)compareCurrentTimeToDays:(NSInteger) compareDateTime{
    
    @try {
        NSString *dateStr = @"";
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy/MM/dd"];
        
        NSDate * nowDate = [NSDate date];
        
        /////  将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [NSDate dateWithTimeIntervalSince1970:compareDateTime];
        /////  取当前时间和转换时间两个日期对象的时间间隔
        /////  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        //        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];//秒数差
        
        NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
        NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *nowcomps = [calendar components:unitFlags fromDate:nowDate];
        NSDateComponents *needcomps = [calendar components:unitFlags fromDate:needFormatDate];
        
        NSInteger nowday = [nowcomps day];
        NSInteger needday = [needcomps day];
        NSInteger compareDay = nowday - needday;//天数差
        
        NSInteger nowyear = [nowcomps year];
        NSInteger needyear = [needcomps year];
        NSInteger compareYear = nowyear - needyear;//年数差
        
        NSInteger nowmonth = [nowcomps month];
        NSInteger needmonth = [needcomps month];
        NSInteger compareMonth = nowmonth - needmonth;//月数差
        
        if (compareYear == 0 && compareMonth == 0) {
            
            if (compareDay >= 1) {//大于1天
                [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else if (compareDay >= 0) {//小于1天大于0
                //今天的
                [dateFormatter setDateFormat:@"HH:mm"];
                dateStr = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:needFormatDate]];
            }else {//小于零的异常情况
                dateStr = @"";
            }
            
        }else {
            [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
            dateStr = [dateFormatter stringFromDate:needFormatDate];
        }
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
}

////计算时差
+ (NSString *)compareCurrentTime:(NSInteger) compareDateTime{
    
    @try {
        NSString *dateStr = @"";
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy/MM/dd"];
        
        NSDate * nowDate = [NSDate date];
        
        /////  将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [NSDate dateWithTimeIntervalSince1970:compareDateTime];
        /////  取当前时间和转换时间两个日期对象的时间间隔
        /////  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];//秒数差
        
        NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
        NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *nowcomps = [calendar components:unitFlags fromDate:nowDate];
        NSDateComponents *needcomps = [calendar components:unitFlags fromDate:needFormatDate];
        
        NSInteger nowday = [nowcomps day];
        NSInteger needday = [needcomps day];
        NSInteger compareDay = nowday - needday;//天数差
        
        NSInteger nowyear = [nowcomps year];
        NSInteger needyear = [needcomps year];
        NSInteger compareYear = nowyear - needyear;//年数差
        
        NSInteger nowmonth = [nowcomps month];
        NSInteger needmonth = [needcomps month];
        NSInteger compareMonth = nowmonth - needmonth;//月数差
        
        if (compareYear == 0 && compareMonth == 0) {
            
            if (compareDay > 10) {//大于十天
                [dateFormatter setDateFormat:@"yyyy/MM/dd"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else if (compareDay >= 0) {//小于十天大于0
                if (compareDay > 1) {//1天~10天
                    dateStr = [NSString stringWithFormat:@"%ld天前",(long)compareDay];
                }else if (compareDay == 1) {//等于1天，昨天的
                    [dateFormatter setDateFormat:@"HH:mm"];
                    dateStr = [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:needFormatDate]];
                }else {//今天的
                    if (time<=60) {  //// 1分钟以内的
                        dateStr = @"刚刚";
                    }else if(time<=60*60){  ////  一个小时以内的
                        
                        int mins = time/60;
                        dateStr = [NSString stringWithFormat:@"%d分钟前",mins];
                        
                    }else {////  一个小时以上的
                        NSInteger hours = time/60/60;
                        dateStr = [NSString stringWithFormat:@"%ld小时前",(long)hours];
                    }
                }
            }else {//小于零的异常情况
                dateStr = @"";
            }
            
        }else {
            [dateFormatter setDateFormat:@"yyyy/MM/dd"];
            dateStr = [dateFormatter stringFromDate:needFormatDate];
        }
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
}


#pragma mark - 正则表达式验证相关
//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile
{
    //手机号以13,14,15,16,17,18,19开头，八个 \d 数字字符
    NSString *phoneRegex = @"^1[3-9]{1}[0-9]{9}$";
    
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

//邮箱验证
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
#pragma mark - 网络相关
//得到UUID
+(NSString*)getUuid {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy(NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}
#pragma mark -文本相关
//定义数字显示规则
+ (double)showNum:(double)num label:(UILabel *)label {
    if (num < 10000) {
        label.text = [NSString stringWithFormat:@"%d",(int)num];
    }
    else {
        num = num / 10000;
        label.text = [NSString stringWithFormat:@"%d万+",(int)num];
    }
    return num;
}

// 过滤所有表情

+ (BOOL)stringContainsEmoji:(NSString *)string {
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
             
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff)
             {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07)
             {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935)
             {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299)
             {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50)
             {
                 returnValue = YES;
             }
         }
     }];
    return returnValue;
}
//设置排版
+ (void)setLableTextParagrah: (UILabel *)label lineSpace:(CGFloat)lineSpace paragraphSpacing:(CGFloat)paragraphSpacing firstLineHeadIndent:(CGFloat)firstLineHeadIndent{
    if (!label.text.length) {
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:label.text];;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:lineSpace];
    [paragraphStyle setParagraphSpacingBefore:paragraphSpacing];
    [paragraphStyle setFirstLineHeadIndent:firstLineHeadIndent];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, label.text.length)];
    
    label.attributedText = attributedString;
}
//判断数据源是否为空
+ (BOOL)modelIsEmpty:(id)model {
    if ([model isKindOfClass:[NSArray class]] || [model isKindOfClass:[NSMutableArray class]] ) {
        NSArray * realModel = (NSArray *)model;
        if (realModel.count) {
            return NO;
        }else {
            return YES;
        }
    }else if ([model isKindOfClass:[NSDictionary class]] ||[model isKindOfClass:[NSMutableDictionary class]]) {
        NSDictionary * realModel = (NSDictionary *)model;
        if (realModel.count) {
            return NO;
        }else {
            return YES;
        }
    }else if ([model isKindOfClass:[NSString class]] ||[model isKindOfClass:[NSMutableString class]]) {
        NSString * realModel = (NSString *)model;
        if (realModel.length) {
            return NO;
        }else {
            return YES;
        }
    }else {
        return YES;
    }
}

+ (UIView *)findFirstResponder:(UIView *)view
{
    if ([view isFirstResponder]) {
        return view;
    }
    for (UIView *subView in view.subviews) {
        UIView *firstResponder = [self findFirstResponder:subView];
        if (firstResponder != nil) {
            return firstResponder;
        }
    }
    return nil;
}
+ (void)setExtraCellLineHidden: (UITableView *)tableView{
    
    UIView *view =[ [UIView alloc]init];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
    
    [tableView setTableHeaderView:view];
    
}
+ (UIImageView *)findHairlineImageViewUnder:(UIView *)view {//消除下划线
    
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        view.hidden = NO;
        UIImageView * lineImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, HG_WIDTH, A_pixel)];
        lineImgView.image = [OnceTime imageWithColor:Theme_Color11];
        [view addSubview:lineImgView];
        [view bringSubviewToFront:lineImgView];
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            imageView.hidden = NO;
            UIImageView * lineImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, HG_WIDTH, A_pixel)];
            lineImgView.image = [OnceTime imageWithColor:Theme_Color11];
            [imageView addSubview:lineImgView];
            [imageView bringSubviewToFront:lineImgView];
            return imageView;
        }
    }
    return nil;
}
+ (NSString *)deleteSpecialChar:(NSString *)str {
    if (str.length) {
        NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、[]{}#%-*=_\\|~＜＞$€^•'@#$%^&*()_'\""];
        str = [str stringByTrimmingCharactersInSet:set];
        
        str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
        str = [str stringByReplacingOccurrencesOfString:@"+86" withString:@""];
        str = [str stringByReplacingOccurrencesOfString:@"＋86" withString:@""];
        NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        str = [str stringByTrimmingCharactersInSet:whitespace];
        
    }
    return str;
}
+ (NSString *)deleteAllWhitespace:(NSString *)str {
    if (str.length) {
        NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        str = [str stringByTrimmingCharactersInSet:whitespace];
        str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
        str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    }
    return str;
}

+ (BOOL)stringIsSimpleAllChinese:(NSString *)str {
    NSInteger i ;
    for(i = 0; i < [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff) {
            continue;
        }
        else {
            break;
        }
    }
    if (i == [str length]) {
        return YES;
    }
    else {
        return NO;
    }
}
+ (BOOL)stringIsAllNumOrChar:(NSString *)str {
    NSString *regex = @"^[A-Za-z0-9]{1,100}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:str];
}


+ (void)openAppWithMyownApp{
    NSString * appId = @"1135773486";
    NSString *urlStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/us/app/id%@?mt=8", appId];
    NSURL *url = [NSURL URLWithString:urlStr];
    [[UIApplication sharedApplication] openURL:url];
}
+ (void)setNavState:(NSString *)navState vc:(UIViewController *)vc{
    
    if ([navState isEqualToString:NavState_White]) {
        if (@available(iOS 7.0, *)) {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        } else {
            // Fallback on earlier versions
        }
        if (@available(iOS 7.0, *)) {
            [vc.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
        } else {
            // Fallback on earlier versions
        }
        [OnceTime findHairlineImageViewUnder:vc.navigationController.navigationBar];
        [vc.navigationController.navigationBar setTintColor:Theme_Color11];
        [vc.navigationController.navigationBar setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:[OnceTime colorWithHexString:@"555555"], NSForegroundColorAttributeName, [UIFont fontWithName:FONT_NAME size:18.0], NSFontAttributeName, nil]];
    }else if ([navState isEqualToString:NavState_Green]) {
        if (@available(iOS 7.0, *)) {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        } else {
            // Fallback on earlier versions
        }
        if (@available(iOS 7.0, *)) {
            [vc.navigationController.navigationBar setBarTintColor:[OnceTime colorWithHexString:@"#80d136"]];
        } else {
            // Fallback on earlier versions
        }
        //#1992f5
        [vc.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
        [vc.navigationController.navigationBar setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont fontWithName:FONT_NAME size:18.0], NSFontAttributeName, nil]];
    }
    else if ([navState isEqualToString:NavState_White_Alpha]) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        if (@available(iOS 7.0, *)) {
            [vc.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
        } else {
            // Fallback on earlier versions
        }
        [vc.navigationController.navigationBar setTintColor:[UIColor clearColor]];
        [vc.navigationController.navigationBar setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:[UIColor clearColor], NSForegroundColorAttributeName, [UIFont fontWithName:FONT_NAME size:18.0], NSFontAttributeName, nil]];
        [vc.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    }
    else {
    }
}
//高精度计算积
+ (NSString *)decimalNumberMutiplyWithString:(NSString *)multiplierValue multiplicandValue:(NSString*)multiplicandValue
{
    if ([multiplierValue isKindOfClass:[NSNumber class]]) {
        NSNumber * num = (NSNumber *)multiplierValue;
        multiplierValue = [num stringValue];
    }
    if ([multiplicandValue isKindOfClass:[NSNumber class]]) {
        NSNumber * num = (NSNumber *)multiplicandValue;
        multiplicandValue = [num stringValue];
    }
    if (!multiplierValue.length || !multiplicandValue.length) {
        return @"0.00";
    }
    NSDecimalNumber *multiplierNumber = [NSDecimalNumber decimalNumberWithString:multiplierValue];
    NSDecimalNumber *multiplicandNumber = [NSDecimalNumber decimalNumberWithString:multiplicandValue];
    NSDecimalNumber *product = [multiplicandNumber decimalNumberByMultiplyingBy:multiplierNumber];
    return [product stringValue];
}
+ (CGFloat)decimalNumberMutiplyWithStringAndReturnFloat:(NSString *)multiplierValue multiplicandValue:(NSString*)multiplicandValue
{
    
    if ([multiplierValue isKindOfClass:[NSNumber class]]) {
        NSNumber * num = (NSNumber *)multiplierValue;
        multiplierValue = [num stringValue];
    }
    if ([multiplicandValue isKindOfClass:[NSNumber class]]) {
        NSNumber * num = (NSNumber *)multiplicandValue;
        multiplicandValue = [num stringValue];
    }
    if (!multiplierValue.length || !multiplicandValue.length) {
        return 0.;
    }
    NSDecimalNumber *multiplierNumber = [NSDecimalNumber decimalNumberWithString:multiplierValue];
    NSDecimalNumber *multiplicandNumber = [NSDecimalNumber decimalNumberWithString:multiplicandValue];
    NSDecimalNumber *product = [multiplicandNumber decimalNumberByMultiplyingBy:multiplierNumber];
    return [product floatValue];
}
//限制只能填写金额的textfield
+ (void)decimalNumberTextField:(UITextField *)textField maxMoney:(NSString *)maxMoney exceedMax:(void (^)(void)) exceedMax {
    
    NSMutableString * startString = [[NSMutableString alloc]initWithString:textField.text];
    CGFloat startNum = [textField.text floatValue];
    maxMoney = [maxMoney stringByReplacingOccurrencesOfString:@"." withString:@""];
    CGFloat maxMoneyNum = [self decimalNumberMutiplyWithStringAndReturnFloat:maxMoney multiplicandValue:@"0.01"];
    
    if (!maxMoney.length) {
        maxMoneyNum = MAXFLOAT;
    }
    NSArray * startStringArray = [startString componentsSeparatedByString:@"."];
    NSString * intString_start = startStringArray[0];
    NSString * floatString_start;
    if (startNum > maxMoneyNum) {
        NSString * existText = textField.text.copy;
        existText = [existText substringToIndex:textField.text.length - 1];
        [textField setText:existText];
        if (exceedMax) {
            exceedMax();
        }
    }else {
        
        if (startNum) {
            if (startStringArray.count == 2) {
                floatString_start = startStringArray[1];
                if (floatString_start.length <= 2 && intString_start.length <= 6) {
                    
                }
                else {
                    if (floatString_start.length > 2) {
                        floatString_start = [floatString_start substringToIndex:2];
                    }
                    if (intString_start.length > 6) {
                        intString_start = [intString_start substringToIndex:6];
                        
                    }
                    [textField setText:[NSString stringWithFormat:@"%@.%@",intString_start,floatString_start.length ? floatString_start : @"00"]];
                }
            }
            else if (startStringArray.count == 1) {
                if (intString_start.length <= 6) {
                    [textField setText:[NSString stringWithFormat:@"%ld",(long)startNum]];
                }
                else {
                    if (intString_start.length > 6) {
                        intString_start = [intString_start substringToIndex:6];
                        
                    }
                    [textField setText:intString_start];
                }
            }else if (startStringArray.count == 3){
                floatString_start = startStringArray[1];
                [textField setText:[NSString stringWithFormat:@"%@.%@",intString_start,floatString_start.length ? floatString_start : @"00"]];
            }else {
            }
        }
        else {
            if ([textField.text isEqualToString:@"0.."] || [textField.text isEqualToString:@"0."] || [textField.text isEqualToString:@"."])
            {
                [textField setText:@"0."];
            }
            else if ([textField.text isEqualToString:@"0.0"]){
                [textField setText:@"0.0"];
            }
            else {
                [textField setText:@"0"];
            }
        }
    }
    
}

+ (NSString *)tensOfThousandsOfCounStr:(NSString *)countStr {
    
    if ([countStr integerValue] >= 10000) {
        
        return [NSString stringWithFormat:@"%.2f万次",[countStr floatValue]/10000];
    }else {
        
        return [NSString stringWithFormat:@"%@次",countStr];
    }
    
}
//+ (BOOL)showLoginView:(UIViewController *)vc gotoHomeTab:(BOOL)gotoHomeTab{
//    NSString * state = [[SessionData getSession]objectForKey:@"state"];
//    if (![state isEqualToString:@"1"]) {
//        LoginRegisterViewController * loginView = [[LoginRegisterViewController alloc]init];
//        loginView.canBackTab = gotoHomeTab;
//        YQNavifationController * loginnav = [[YQNavifationController alloc]initWithRootViewController:loginView];
//        [vc presentViewController:loginnav animated:YES completion:nil];
//        return NO;
//    }
//    return YES;
//}
//转换成时分秒

+ (NSString *)timeFormatted:(int)totalSeconds
{
    
    
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    
    return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}



//转换成当前时刻

+ (NSDate *)timeDateFormatted:(int)totalSeconds

{
    NSDate  *date = [NSDate dateWithTimeIntervalSince1970:totalSeconds];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    return localeDate;
}
+ (NSString *)currentTimeTransform:(int)totalSeconds {
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *theday = [NSDate dateWithTimeIntervalSince1970:totalSeconds];
    NSString *day = [dateFormatter stringFromDate:theday];
    
    return day;
}
//磁盘总空间
+ (CGFloat)diskOfAllSizeMBytes{
    CGFloat size = 0.0;
    NSError *error;
    NSDictionary *dic = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) {
#ifdef DEBUG
        NSLog(@"error: %@", error.localizedDescription);
#endif
    }else{
        NSNumber *number = [dic objectForKey:NSFileSystemSize];
        size = [number floatValue]/1024/1024;
    }
    return size;
}
//磁盘可用空间
+ (CGFloat)diskOfFreeSizeMBytes{
    CGFloat size = 0.0;
    NSError *error;
    NSDictionary *dic = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) {
#ifdef DEBUG
        NSLog(@"error: %@", error.localizedDescription);
#endif
    }else{
        NSNumber *number = [dic objectForKey:NSFileSystemFreeSize];
        size = [number floatValue]/1024/1024;
    }
    return size;
}
//获取文件大小
+ (long long)fileSizeAtPath:(NSString *)filePath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filePath]) return 0;
    return [[fileManager attributesOfItemAtPath:filePath error:nil] fileSize];
}
//获取文件夹下所有文件的大小
+ (long long)folderSizeAtPath:(NSString *)folderPath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *filesEnumerator = [[fileManager subpathsAtPath:folderPath] objectEnumerator];
    NSString *fileName;
    long long folerSize = 0;
    while ((fileName = [filesEnumerator nextObject]) != nil) {
        NSString *filePath = [folderPath stringByAppendingPathComponent:fileName];
        folerSize += [self fileSizeAtPath:filePath];
    }
    return folerSize;
}
//获取字符串(或汉字)首字母
+ (NSString *)firstCharacterWithString:(NSString *)string{
    NSMutableString *str = [NSMutableString stringWithString:string];
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *pingyin = [str capitalizedString];
    return [pingyin substringToIndex:1];
}
//将字符串数组按照元素首字母顺序进行排序分组
+ (NSDictionary *)dictionaryOrderByCharacterWithOriginalArray:(NSArray *)array{
    if (array.count == 0) {
        return nil;
    }
    for (id obj in array) {
        if (![obj isKindOfClass:[NSString class]]) {
            return nil;
        }
    }
    UILocalizedIndexedCollation *indexedCollation = [UILocalizedIndexedCollation currentCollation];
    NSMutableArray *objects = [NSMutableArray arrayWithCapacity:indexedCollation.sectionTitles.count];
    //创建27个分组数组
    for (int i = 0; i < indexedCollation.sectionTitles.count; i++) {
        NSMutableArray *obj = [NSMutableArray array];
        [objects addObject:obj];
    }
    NSMutableArray *keys = [NSMutableArray arrayWithCapacity:objects.count];
    //按字母顺序进行分组
    NSInteger lastIndex = -1;
    for (int i = 0; i < array.count; i++) {
        NSInteger index = [indexedCollation sectionForObject:array[i] collationStringSelector:@selector(uppercaseString)];
        [[objects objectAtIndex:index] addObject:array[i]];
        lastIndex = index;
    }
    //去掉空数组
    for (int i = 0; i < objects.count; i++) {
        NSMutableArray *obj = objects[i];
        if (obj.count == 0) {
            [objects removeObject:obj];
        }
    }
    //获取索引字母
    for (NSMutableArray *obj in objects) {
        NSString *str = obj[0];
        NSString *key = [self firstCharacterWithString:str];
        [keys addObject:key];
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:objects forKey:keys];
    return dic;
}
/**
 *  计算上次日期距离现在多久
 *
 *  @param lastTime    上次日期(需要和格式对应)
 *  @param format1     上次日期格式
 *  @param currentTime 最近日期(需要和格式对应)
 *  @param format2     最近日期格式
 *
 *  @return xx分钟前、xx小时前、xx天前
 */
+ (NSString *)timeIntervalFromLastTime:(NSString *)lastTime
                        lastTimeFormat:(NSString *)format1
                         ToCurrentTime:(NSString *)currentTime
                     currentTimeFormat:(NSString *)format2{
    //上次时间
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc]init];
    dateFormatter1.dateFormat = format1;
    NSDate *lastDate = [dateFormatter1 dateFromString:lastTime];
    //当前时间
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc]init];
    dateFormatter2.dateFormat = format2;
    NSDate *currentDate = [dateFormatter2 dateFromString:currentTime];
    return [OnceTime timeIntervalFromLastTime:lastDate ToCurrentTime:currentDate];
}
+ (NSString *)timeIntervalFromLastTime:(NSDate *)lastTime ToCurrentTime:(NSDate *)currentTime{
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    //上次时间
    NSDate *lastDate = [lastTime dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:lastTime]];
    //当前时间
    NSDate *currentDate = [currentTime dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:currentTime]];
    //时间间隔
    NSInteger intevalTime = [currentDate timeIntervalSinceReferenceDate] - [lastDate timeIntervalSinceReferenceDate];
    
    //秒、分、小时、天、月、年
    NSInteger minutes = intevalTime / 60;
    NSInteger hours = intevalTime / 60 / 60;
    NSInteger day = intevalTime / 60 / 60 / 24;
    NSInteger month = intevalTime / 60 / 60 / 24 / 30;
    NSInteger yers = intevalTime / 60 / 60 / 24 / 365;
    
    if (minutes <= 10) {
        return  @"刚刚";
    }else if (minutes < 60){
        return [NSString stringWithFormat: @"%ld分钟前",(long)minutes];
    }else if (hours < 24){
        return [NSString stringWithFormat: @"%ld小时前",(long)hours];
    }else if (day < 30){
        return [NSString stringWithFormat: @"%ld天前",(long)day];
    }else if (month < 12){
        NSDateFormatter * df =[[NSDateFormatter alloc]init];
        df.dateFormat = @"M月d日";
        NSString * time = [df stringFromDate:lastDate];
        return time;
    }else if (yers >= 1){
        NSDateFormatter * df =[[NSDateFormatter alloc]init];
        df.dateFormat = @"yyyy年M月d日";
        NSString * time = [df stringFromDate:lastDate];
        return time;
    }
    return @"";
}
//判断手机号码格式是否正确
+ (BOOL)valiMobile:(NSString *)mobile{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}
//利用正则表达式验证
+ (BOOL)isAvailableEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
#pragma mark - 对图片进行滤镜处理
// 怀旧 --> CIPhotoEffectInstant                         单色 --> CIPhotoEffectMono
// 黑白 --> CIPhotoEffectNoir                            褪色 --> CIPhotoEffectFade
// 色调 --> CIPhotoEffectTonal                           冲印 --> CIPhotoEffectProcess
// 岁月 --> CIPhotoEffectTransfer                        铬黄 --> CIPhotoEffectChrome
// CILinearToSRGBToneCurve, CISRGBToneCurveToLinear, CIGaussianBlur, CIBoxBlur, CIDiscBlur, CISepiaTone, CIDepthOfField
+ (UIImage *)filterWithOriginalImage:(UIImage *)image filterName:(NSString *)name{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIFilter *filter = [CIFilter filterWithName:name];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    UIImage *resultImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return resultImage;
}
#pragma mark - 对图片进行模糊处理
// CIGaussianBlur ---> 高斯模糊
// CIBoxBlur      ---> 均值模糊(Available in iOS 9.0 and later)
// CIDiscBlur     ---> 环形卷积模糊(Available in iOS 9.0 and later)
// CIMedianFilter ---> 中值模糊, 用于消除图像噪点, 无需设置radius(Available in iOS 9.0 and later)
// CIMotionBlur   ---> 运动模糊, 用于模拟相机移动拍摄时的扫尾效果(Available in iOS 9.0 and later)
+ (UIImage *)blurWithOriginalImage:(UIImage *)image blurName:(NSString *)name radius:(NSInteger)radius{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc] initWithImage:image];
    CIFilter *filter;
    if (name.length != 0) {
        filter = [CIFilter filterWithName:name];
        [filter setValue:inputImage forKey:kCIInputImageKey];
        if (![name isEqualToString:@"CIMedianFilter"]) {
            [filter setValue:@(radius) forKey:@"inputRadius"];
        }
        CIImage *result = [filter valueForKey:kCIOutputImageKey];
        CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
        UIImage *resultImage = [UIImage imageWithCGImage:cgImage];
        CGImageRelease(cgImage);
        return resultImage;
    }else{
        return nil;
    }
}
//全屏截图
+ (UIImage *)shotScreen{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIGraphicsBeginImageContext(window.bounds.size);
    [window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
//截取view生成一张图片
+ (UIImage *)shotWithView:(UIView *)view{
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
//压缩图片到指定尺寸大小
+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size{
    UIImage *resultImage = image;
    UIGraphicsBeginImageContext(size);
    [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIGraphicsEndImageContext();
    return resultImage;
}
//压缩图片到指定文件大小
+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size{
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    CGFloat dataKBytes = data.length/1000.0;
    CGFloat maxQuality = 0.9f;
    CGFloat lastData = dataKBytes;
    while (dataKBytes > size && maxQuality > 0.01f) {
        maxQuality = maxQuality - 0.01f;
        data = UIImageJPEGRepresentation(image, maxQuality);
        dataKBytes = data.length/1000.0;
        if (lastData == dataKBytes) {
            break;
        }else{
            lastData = dataKBytes;
        }
    }
    return data;
}
@end
