//
//  UIImageView+Once.m
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import "UIImageView+Once.h"

@implementation UIImageView (Once)

+(UIImageView*)imageViewWithFrame:(TCGRect)frame
                            image:(NSString*)imageName{
    UIImageView*imageView=[[UIImageView alloc]initWithFrame:frame];
    imageView.image=[UIImage imageNamed:imageName];
    return imageView;
}

@end
