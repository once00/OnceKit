//
//  UIBarButtonItem+Once.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Once)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(UIImage *)image highImage:(UIImage *)highImage;
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title color:(UIColor *)color;


@end
