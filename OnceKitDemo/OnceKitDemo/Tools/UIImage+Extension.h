//
//  UIImage+Extension.h
//  西北招商网云管理系统
//
//  Created by 曹绍奇 on 2017/7/12.
//  Copyright © 2017年 曹绍奇. All rights reserved.

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
+ (UIImage *) imageWithName:(NSString *) imageName;
+ (UIImage *) resizableImageWithName:(NSString *)imageName;
- (UIImage*) scaleImageWithSize:(CGSize)size;

- (UIImage *)imageWithImageeeeeee:(UIImage*)image
               scaledToSize:(CGSize)newSize;


+ (NSData *)imageWithImageaaaa:(UIImage*)image
              scaledToSize:(CGSize)newSize;

@end
