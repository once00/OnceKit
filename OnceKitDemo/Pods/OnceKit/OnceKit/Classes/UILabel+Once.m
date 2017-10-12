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
            numberOfLines:(BOOL)Lines
{
    UILabel*label=[[UILabel alloc]initWithFrame:frame];
    
    label.text=text;
    
    UIFont*fontP;
    IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:font*SCALE] ): (fontP = [UIFont systemFontOfSize:font*SCALE]);
    label.font=fontP;
    label.textColor=textColor;
    label.textAlignment=alignment;
    
    if (Lines==YES) {
        label.numberOfLines = 0;
        [label sizeToFit];
    }
    
    return label;
}

+(UILabel*)labelWithFrame:(TCGRect)frame
                     text:(NSString*)text
                 textFont:(CGFloat)font
                textColor:(UIColor*)textColor
            TextAlignment:(NSTextAlignment)alignment
                WithTitle:(BOOL)Lines
{
    UILabel*label=[[UILabel alloc]initWithFrame:frame];
    
    label.text=text;
    
    UIFont*fontP;
    IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:font*SCALE] ): (fontP = [UIFont systemFontOfSize:font*SCALE]);
    label.font=fontP;
    label.textColor=textColor;
    label.textAlignment=alignment;
    
    if (Lines==YES) {
        [label sizeToFit];
    }
    
    return label;
}


+(UILabel*)labelWithFrame:(TCGRect)frame
                     text:(NSString*)text
                 textFont:(CGFloat)font
                textColor:(UIColor*)textColor
            TextAlignment:(NSTextAlignment)alignment
            withLineSpace:(float)lineSpace
                WordSpace:(float)wordSpace
{
    UILabel*label=[[UILabel alloc]initWithFrame:frame];

    UIFont*fontP;
    IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:font*SCALE] ): (fontP = [UIFont systemFontOfSize:font*SCALE]);
    label.font=fontP;
    label.textColor=textColor;
    label.textAlignment=alignment;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    label.numberOfLines = 0;
    label.attributedText = attributedString;
    [label sizeToFit];
    
    return label;
}

@end
