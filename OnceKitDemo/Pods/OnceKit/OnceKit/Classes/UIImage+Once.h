//
//  UIImage+Once.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OnceCommonMacro.h"

@interface UIImage (Once)

/**
 *  压缩图片(一半)
 *
 *  @param imageName    图片
 */
+(UIImage *)resizeImage:(NSString *)imageName;
/**
 *  设置图片颜色
 *
 *  @param color    图片颜色
 */
+(UIImage *)imageWithColor:(UIColor *)color;
/**
 *  设置透明度
 *
 *  @param color    图片颜色
 *  @param alpha    透明度
 */
+(UIImage *)imageWithColor:(UIColor *)color alpha:(float)alpha;
/**
 *  图片view
 *
 *  @param theView    图片
 */
+(UIImage *)imageFromView:(UIView *)theView;
/**
 *  压缩图片
 *
 *  @param image    那个image对象
 *  @param newSize    图片大小
 */
+(UIImage*)imageWithImage:(UIImage*)image
             scaledToSize:(CGSize)newSize;

+ (UIImage *) imageWithName:(NSString *) imageName;

/**
 *  URL转image
 *
 *  @param fileURL    url
 */
+(UIImage *) getImageFromURL:(NSString *)fileURL;
@end
