//
//  UIImageView+Once.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemOnce.h"

@interface UIImageView (Once)
/**
 *  大小,图片
 *
 *  @param frame    大小
 *  @param imageName    图片
 */
+(UIImageView*)imageViewWithFrame:(TCGRect)frame
                            image:(NSString*)imageName;

/**
 *  大小,图片,图片的显示方式,是否裁剪图片
 *
 *  @param frame    大小
 *  @param imageName    图片
 *  @param contentMode    图片的显示方式
 *  @param toBounds    是否裁剪图片
 */
+(UIImageView*)imageViewWithFrame:(TCGRect)frame
                            image:(NSString*)imageName
                      ContentMode:(UIViewContentMode)contentMode
                         ToBounds:(BOOL)toBounds
                      cornerRadiu:(CGFloat)cornerRadiu;
@end
