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

+ (NSString *)dateForDoubleDateStrfuncell:(double)dateStr andFormatter:(NSString *)formatter returnFormatter:(NSString *)returnFormatter;

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


/**
 色值转换
 
 @param stringToConvert 16进制色值
 @return UIColor类型的颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

/**
 给按钮添加梯度的色值
 
 @param btn 需要添加的按钮
 @param colors 普通状态下的颜色数组
 @param highlightedColors 高亮状态下颜色的数组
 */
+ (void)addGradientColorLayer:(UIButton *)btn colors:(NSArray*)colors highlightedColors:(NSArray *)highlightedColors;

/**
 时间戳转换成日期
 
 @param totalSeconds 时间戳
 @return 返回当前的时间
 */
+ (NSDate *)timeDateFormatted:(int)totalSeconds;

/**
 根据时间戳获取时分秒
 
 @param totalSeconds 总的时间戳
 @return 00：00：00格式的时间字符串
 */
+ (NSString *)timeFormatted:(int)totalSeconds;

/**
 以1970年为基准的时间
 
 @param msSince1970 时间段
 @return date类型的时间
 */
+ (NSDate *)dateFromLongLong:(NSTimeInterval)msSince1970;

/**
 //从时间格式得到时间字符串格式
 
 @param date 需要转化的时间
 @param format 某种时间格式
 @return 转化后的时间的字符串
 */
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format;

+ (NSDate *)stringToDate:(NSString *)dateString format:(NSString *)format;

/**
 根据生日得到年龄
 
 @param birthday 生日的日期
 @return 年龄字符串
 */
+ (NSString *)countAge:(NSString *)birthday;

+ (NSString *) compareCurrentTime:(NSInteger) compareDateTime;

+ (double)showNum:(double)num label:(UILabel *)label;

+ (NSString *)countTimeToString:(NSString *)dateString;

+ (NSString *)getCurrentTime:(NSString *)timeformat;

+ (BOOL) validateMobile:(NSString *)mobile;

+ (BOOL) validateEmail:(NSString *)email;

/**
 根据颜色获得一张图片
 
 @param color 颜色
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

+ (NSString*)getUuid;

/**
 字符串中是否含有表情
 
 @param string 需要判断的字符串
 @return 是否
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;

+ (void)setLableTextParagrah: (UILabel *)label lineSpace:(CGFloat)lineSpace paragraphSpacing:(CGFloat)paragraphSpacing firstLineHeadIndent:(CGFloat)firstLineHeadIndent;

+ (BOOL)modelIsEmpty:(id)model;

+ (UIView *)findFirstResponder:(UIView *)view;

+ (void)setExtraCellLineHidden: (UITableView *)tableView;

+ (UIImageView *)findHairlineImageViewUnder:(UIView *)view;

+ (NSString *)deleteSpecialChar:(NSString *)str;

+ (NSString *)deleteAllWhitespace:(NSString *)str;

+ (BOOL)stringIsSimpleAllChinese:(NSString *)str;

+ (BOOL)stringIsAllNumOrChar:(NSString *)str;

+ (void)openAppWithMyownApp;

+ (void)setNavState:(NSString *)navState vc:(UIViewController *)vc;

+ (NSString *)decimalNumberMutiplyWithString:(NSString *)multiplierValue multiplicandValue:(NSString*)multiplicandValue;

+ (CGFloat)decimalNumberMutiplyWithStringAndReturnFloat:(NSString *)multiplierValue multiplicandValue:(NSString*)multiplicandValue;
+ (NSString *)compareCurrentTimeToDays:(NSInteger) compareDateTime;

+ (void)decimalNumberTextField:(UITextField *)textField maxMoney:(NSString *)maxMoney exceedMax:(void (^)(void)) exceedMax;

+ (NSString *)tensOfThousandsOfCounStr:(NSString *)countStr;

+ (BOOL)showLoginView:(UIViewController *)vc gotoHomeTab:(BOOL)gotoHomeTab;
+ (NSString *)currentTimeTransform:(int)totalSeconds;
//磁盘总空间
+ (CGFloat)diskOfAllSizeMBytes;
//磁盘可用空间
+ (CGFloat)diskOfFreeSizeMBytes;
//获取文件大小
+ (long long)fileSizeAtPath:(NSString *)filePath;
//获取文件夹下所有文件的大小
+ (long long)folderSizeAtPath:(NSString *)folderPath;
//获取字符串(或汉字)首字母
+ (NSString *)firstCharacterWithString:(NSString *)string;
//将字符串数组按照元素首字母顺序进行排序分组
+ (NSDictionary *)dictionaryOrderByCharacterWithOriginalArray:(NSArray *)array;
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
                     currentTimeFormat:(NSString *)format2;
//判断手机号码格式是否正确
+ (BOOL)valiMobile:(NSString *)mobile;
//利用正则表达式验证邮箱
+ (BOOL)isAvailableEmail:(NSString *)email;
#pragma mark - 对图片进行滤镜处理
// 怀旧 --> CIPhotoEffectInstant                         单色 --> CIPhotoEffectMono
// 黑白 --> CIPhotoEffectNoir                            褪色 --> CIPhotoEffectFade
// 色调 --> CIPhotoEffectTonal                           冲印 --> CIPhotoEffectProcess
// 岁月 --> CIPhotoEffectTransfer                        铬黄 --> CIPhotoEffectChrome
// CILinearToSRGBToneCurve, CISRGBToneCurveToLinear, CIGaussianBlur, CIBoxBlur, CIDiscBlur, CISepiaTone, CIDepthOfField
+ (UIImage *)filterWithOriginalImage:(UIImage *)image filterName:(NSString *)name;
#pragma mark - 对图片进行模糊处理
// CIGaussianBlur ---> 高斯模糊
// CIBoxBlur      ---> 均值模糊(Available in iOS 9.0 and later)
// CIDiscBlur     ---> 环形卷积模糊(Available in iOS 9.0 and later)
// CIMedianFilter ---> 中值模糊, 用于消除图像噪点, 无需设置radius(Available in iOS 9.0 and later)
// CIMotionBlur   ---> 运动模糊, 用于模拟相机移动拍摄时的扫尾效果(Available in iOS 9.0 and later)
+ (UIImage *)blurWithOriginalImage:(UIImage *)image blurName:(NSString *)name radius:(NSInteger)radius;
//全屏截图
+ (UIImage *)shotScreen;
//截取view生成一张图片
+ (UIImage *)shotWithView:(UIView *)view;
//压缩图片到指定尺寸大小
+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size;
//压缩图片到指定文件大小
+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;


@end
