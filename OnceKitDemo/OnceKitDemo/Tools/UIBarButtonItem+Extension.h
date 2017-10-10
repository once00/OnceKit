//
//  UIBarButtonItem+Extension.h
//  当地主
//
//  Created by 尹春风 on 16/1/11.
//  Copyright © 2016年 曹绍奇. All rights reserved.
//


#import <UIKit/UIKit.h>

/**
 *  导航item的扩展
 */
@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(UIImage *)image highImage:(UIImage *)highImage;
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title color:(UIColor *)color;

@end
