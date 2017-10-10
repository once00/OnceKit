//
//  BKExtensionUtils.h
//  BKHousePet
//
//  Created by Tayte on 2017/3/20.
//  Copyright © 2017年 Tayte. All rights reserved.
//

//#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import "systemExtension.h"
#import <CommonCrypto/CommonCryptor.h>
@interface TCExtension : NSObject
@end
@interface NSArray(extension)

-(NSArray *)DWObjectsFromObjectsName:(NSString *)name;

@end



@interface UIImage(Utils)

+(UIImage *)resizeImage:(NSString *)imageName;
+(UIImage *)imageWithColor:(UIColor *)color;
+(UIImage *)imageWithColor:(UIColor *)color alpha:(float)alpha;
+(UIImage *)imageFromView:(UIView *)theView;
//压缩图片
+(UIImage*)imageWithImage:(UIImage*)image
             scaledToSize:(CGSize)newSize;
@end

#pragma UIButton
@interface UIButton (Utils)


+(UIButton *)buttonWithFrame:(TCGRect1)frame
                 normalTitle:(NSString *)title
            normalTitleColor:(UIColor *)titleColor
            normalTiltleFont:(CGFloat)font
                 cornerRadiu:(CGFloat)cornerRadiu
             backGroundColor:(UIColor*)backGroundColor
                      target:(id)target selector:(SEL)selector;

+(UIButton *)buttonWithFrame:(TCGRect1)frame
                 normalTitle:(NSString *)title
            normalTitleColor:(UIColor *)titleColor
            normalTiltleFont:(CGFloat)font
                 cornerRadiu:(CGFloat)cornerRadiu
         selectedGroundColor:(UIColor*)selectedGroundColor
             backGroundColor:(UIColor*)backGroundColor
                      target:(id)target selector:(SEL)selector;

+(UIButton *)buttonWithFrame:(TCGRect1)frame
         BackgroundImageName:(NSString *)backgroundImageName
                      target:(id)target selector:(SEL)selector;

@end

#pragma UIView

@interface UIView (Utils)
/**
 * @brief Shortcut for frame.origin.x.
 *        Sets frame.origin.x = originX
 */
@property (nonatomic) CGFloat originX;

/**
 * @brief Shortcut for frame.origin.y
 *        Sets frame.origin.y = originY
 */
@property (nonatomic) CGFloat originY;

/**
 * @brief Shortcut for frame.origin.x + frame.size.width
 *       Sets frame.origin.x = rightX - frame.size.width
 */
@property (nonatomic) CGFloat rightX;

/**
 * @brief Shortcut for frame.origin.y + frame.size.height
 *        Sets frame.origin.y = bottomY - frame.size.height
 */
@property (nonatomic) CGFloat bottomY;

/**
 * @brief Shortcut for frame.size.width
 *        Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * @brief Shortcut for frame.size.height
 *        Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * @brief Shortcut for center.x
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * @brief Shortcut for center.y
 *        Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;

/**
 * @brief Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * @brief Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

///< 移除此view上的所有子视图
- (void)removeAllSubviews;
#pragma mark--------------------
+(UIView*)viewWithFrame:(TCGRect1)frame
          backGroundColor:(UIColor*)color;

@end

#pragma UILabel
@interface UILabel (Utils)
+(UILabel*)labelWithFrame:(TCGRect1)frame
                     text:(NSString*)text
                 textFont:(CGFloat)font
                textColor:(UIColor*)textColor
            TextAlignment:(NSTextAlignment)alignment;
@end
#pragma UIImageView
@interface UIImageView (Utils)
+(UIImageView*)imageViewWithFrame:(TCGRect1)frame
                            image:(NSString*)imageName;
@end



@interface UITextField (Utils)
+(UITextField*)textFieldWithFrame:(TCGRect1)frame
                     keyboardType:(UITextBorderStyle)borderStyle
                placeholderString:(NSString*)placeholderString
            placeholderStringFont:(CGFloat)placeFont
                 placeholderColor:(UIColor*)placeholderColor
                        textColor:(UIColor*)textColor
                         textFont:(CGFloat)textFont
                    textAlignment:(NSTextAlignment)alignment;
@end





@interface NSData (AES)

- (NSData *)AES256EncryptWithKey:(NSString *)key;   //加密
- (NSData *)AES256DecryptWithKey:(NSString *)key;   //解密
- (NSData *)AES128Operation:(CCOperation)operation key:(NSString *)key iv:(NSString *)iv;
- (NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv;
- (NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv;
- (NSData *)AES128EncryptWithKey:(NSString *)key;   //加密
- (NSData *)AES128DecryptWithKey:(NSString *)key;   //解密
- (NSString *)newStringInBase64FromData;            //追加64编码
+ (NSString*)base64encode:(NSString*)str;           //同上64编码
+ (NSData *)dataWithBase64EncodedString:(NSString *)string;  //base64 解密

@end


//@interface CATextLayer (Utils)
//-(CATextLayer*)CATextLayerTextFrame:(TCGRect)frame
//                              text:(NSString*)text
//                          textFont:(CGFloat)font
//                         textColor:(UIColor*)textColor
//                     TextAlignment:(NSTextAlignment)alignment;
//
//@end


@interface NSMutableDictionary(DYSetObjectForKey)

-(void)DWSetObject:(id)anObject forKey:(id<NSCopying>)aKey;


@end

@interface NSString (SKCategory)
/**
 *	@brief	判断是否为手机号
 *	@return	结果,如果是手机号则返回YES,否则为NO
 */
- (BOOL)isPhone;

@end

@interface NSDictionary(DYObjectForKey)
-(NSString *)DWStringForKey:(id)key;
-(NSArray *)DWArrayForKey:(id)key;
-(NSDictionary *)DWDictionaryForKey:(id)key;
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end

