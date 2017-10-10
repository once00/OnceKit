//
//  XFTools.m
//  帝友系统V5
//
//  Created by lxf on 2017/2/9.
//  Copyright © 2017年 wayne. All rights reserved.
//

#import "XFTools.h"

@interface XFTools ()<UIAlertViewDelegate>{
    
}

@property (nonatomic, assign) BOOL isShow;

@end

@implementation XFTools


static   XFTools* xftools;

+(XFTools *)shareInstance
{
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!xftools) {
            xftools = [XFTools new];
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






+(void)showAlertWithMessage:(NSString *)message{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    
    [alertView show];
    
    
    
}

//
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
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
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            
                        DDLog(@"打电话");
        }];
    }
    
}


@end
