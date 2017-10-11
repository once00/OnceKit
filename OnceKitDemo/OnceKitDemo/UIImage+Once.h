//
//  UIImage+Once.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Once)

+(UIImage *)resizeImage:(NSString *)imageName;
+(UIImage *)imageWithColor:(UIColor *)color;
+(UIImage *)imageWithColor:(UIColor *)color alpha:(float)alpha;
+(UIImage *)imageFromView:(UIView *)theView;
//压缩图片
+(UIImage*)imageWithImage:(UIImage*)image
             scaledToSize:(CGSize)newSize;

@end
