//
//  NSString+Once.h
//  MBProgressHUD
//
//  Created by 曹绍奇 on 2017/10/12.
//

#import <Foundation/Foundation.h>

@interface NSString (Once)
/**
 * 去掉字符串的空格
 */
- (NSString *)trimString;

//是否为空字符串
- (BOOL) isBlankString;

/**
 *  验证日期格式
 *
 */
-(BOOL)isDatecorrect;
/**
 *    @brief    判断是否为手机号
 *    @return    结果,如果是手机号则返回YES,否则为NO
 */
- (BOOL)isPhone;
/**
 *  是否为电话号码
 *
 *    传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
-(BOOL)isPhoneNumber ;
/**
 *  检测是否为邮箱
 *
 *  传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
-(BOOL)detectionIsEmailQualified ;
/**
 *  检测用户输入密码是否以字母开头，长度在6-18之间，只能包含字符、数字和下划线。
 *
 * 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
-(BOOL)detectionIsPasswordQualified ;
/**
 *  验证身份证号（15位或18位数字）
 *  传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
-(BOOL)detectionIsIdCardNumberQualified ;

/**
 *  验证IP地址（15位或18位数字）
 * 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
-(BOOL)detectionIsIPAddress ;

/**
 *  验证输入的是否全为数字
 * 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
-(BOOL)detectionIsAllNumber ;

/**
 *  验证由26个英文字母组成的字符串
 * 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
-(BOOL)detectionIsEnglishAlphabet ;
/**
 *  验证输入的是否是URL地址
 * 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
-(BOOL)detectionIsUrl ;

/**
 *  验证输入的是否是URL地址
 * 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
-(BOOL)detectionIsChinese ;

/**
 *  验证输入的是否是URL地址
 * 传入需要检测的字符串
 *
 *  @return 返回检测结果 是或者不是
 */
-(BOOL)detectionNormalText:(NSString *)normalStr WithHighLightText:(NSString *)HighLightStr;

/**
 *  计算文字frme
 *
 *  @param font    <#font description#>
 *  @param maxSize <#maxSize description#>
 *
 *  @return <#return value description#>
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithIntCode:(int)intCode;

/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithStringCode:(NSString *)stringCode;

/**
 *  是否为emoji字符
 */
- (BOOL)isEmoji;

@end
