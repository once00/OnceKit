//
//  UILabel+Once.m
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import "UILabel+Once.h"

#define IS_IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0)

@implementation UILabel (Once)
+(UILabel*)labelWithFrame:(TCGRect)frame
                     text:(NSString*)text
                 textFont:(CGFloat)font
                textColor:(UIColor*)textColor
            TextAlignment:(NSTextAlignment)alignment
{
    
    UILabel*label=[[UILabel alloc]initWithFrame:frame];
    
    label.text=text;
    
    UIFont*fontP;
    IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:font*SCALE] ): (fontP = [UIFont systemFontOfSize:font*SCALE]);
    label.font=fontP;
    label.textColor=textColor;
    label.textAlignment=alignment;
    return label;
}

@end
