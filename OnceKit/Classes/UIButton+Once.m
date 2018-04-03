//
//  UIButton+Once.m
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import "UIButton+Once.h"
#import "UIImage+Once.h"

#define IS_IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0)

@implementation UIButton (Once)

+(UIButton *)buttonWithnormalTitle:(NSString *)title
                  normalTitleColor:(UIColor *)titleColor
                  normalTiltleFont:(CGFloat)font
                       cornerRadiu:(CGFloat)cornerRadiu
                   backGroundColor:(UIColor*)backGroundColor
             backSelectGroundColor:(UIColor*)backSelectGroundColor
                       BorderWidth:(float)width
                       BorderColor:(UIColor*)bordercolor
                            target:(id)target selector:(SEL)selector{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (cornerRadiu!=0) {
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:cornerRadiu];
    }
    [button setTitle:title forState:UIControlStateNormal];
    UIFont *fontP ;//这个是9.0以后自带的平方字体
    IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:font*SCALE] ): (fontP = [UIFont systemFontOfSize:font*SCALE]);
    [button.titleLabel setFont:fontP];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    if (button.selected==YES) {
        [button setBackgroundColor:backSelectGroundColor];
    }else{
        [button setBackgroundColor:backGroundColor];
    }
    [button.layer setBorderWidth:width];
    [button.layer setBorderColor:bordercolor.CGColor];
    if (target!=nil&&selector!=nil) {
        
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
}

+(UIButton *)buttonWithFrame:(TCGRect)frame
                 normalTitle:(NSString *)title
            normalTitleColor:(UIColor *)titleColor
            normalTiltleFont:(CGFloat)font
                 cornerRadiu:(CGFloat)cornerRadiu
             backGroundColor:(UIColor*)backGroundColor
                      target:(id)target selector:(SEL)selector
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    button.frame = frame;
    if (cornerRadiu!=0) {
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:cornerRadiu];
        //        [button.layer setBorderWidth:1.0];
    }
    
    
    
    [button setTitle:title forState:UIControlStateNormal];
    
    UIFont *fontP ;//这个是9.0以后自带的平方字体
    IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:font*SCALE] ): (fontP = [UIFont systemFontOfSize:font*SCALE]);
    
    [button.titleLabel setFont:fontP];
    
    
    
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setBackgroundColor:backGroundColor];
    if (target!=nil&&selector!=nil) {
        
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
    
}
+(UIButton *)buttonWithFrame:(TCGRect)frame
                 normalTitle:(NSString *)title
            normalTitleColor:(UIColor *)titleColor
            normalTiltleFont:(CGFloat)font
                 cornerRadiu:(CGFloat)cornerRadiu
         selectedGroundColor:(UIColor*)selectedGroundColor
             backGroundColor:(UIColor*)backGroundColor
                      target:(id)target selector:(SEL)selector{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (cornerRadiu!=0) {
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:cornerRadiu];
    }
    
    [button setTitle:title forState:UIControlStateNormal];
    UIFont*fontP;
    IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:font*SCALE] ): (fontP = [UIFont systemFontOfSize:font*SCALE]);
    
    [button.titleLabel setFont:fontP];
    
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setBackgroundColor:backGroundColor];
    [button setBackgroundImage:[UIImage imageWithColor:backGroundColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:selectedGroundColor] forState:UIControlStateSelected];
    if (target!=nil&&selector!=nil) {
        
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
    
}
+(UIButton *)buttonWithFrame:(TCGRect)frame
         BackgroundImageName:(NSString *)backgroundImageName
                      target:(id)target selector:(SEL)selector{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    [button setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+(UIButton *)buttonWithFrame:(TCGRect)frame
             backGroundColor:(UIColor *)backGroundColor
                      target:(id)target selector:(SEL)selector{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    [button setBackgroundColor:backGroundColor];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

@end
