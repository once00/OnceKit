//
//  UIImage+DDZ.h
//  当地主
//
//  Created by 曹绍奇 on 15/9/28.
//  Copyright © 2015年 曹绍奇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DDZ)

/**
 * 拉伸图片
 */
+ (UIImage *)resizedImage:(NSString *)name;

/**
 * 压缩图片
 */
+ (UIImage *)zipImage:(UIImage *)image scaledToSize:(CGSize)newSize;

@end
