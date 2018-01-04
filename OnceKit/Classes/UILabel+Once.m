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
+(UILabel*)labelWithText:(NSString*)text
                textFont:(CGFloat)font
               textColor:(UIColor*)textColor
           TextAlignment:(NSTextAlignment)alignment
           numberOfLines:(BOOL)Lines{
    UILabel*label=[[UILabel alloc]init];
    
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

+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

#define UILABEL_LINE_SPACE 6
#define HEIGHT [ [ UIScreen mainScreen ] bounds ].size.height

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    //    NSString * str=@"您现在接受何种药物或者治疗控制您的疼痛?";
    //    labelOne.text = str;
    //    // 设置行数为不限制
    //    labelOne.numberOfLines = 0;
    //
    //    CGSize size = CGSizeMake(200,2000);
    //
    //    NSDictionary * dict = @{NSFontAttributeName : labelOne.font};
    //    CGSize labelSize = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    
    
    //    NSLog(@"%f--%f",labelSize.width,labelSize.height);
    
    //    labelOne.frame = CGRectMake(10, 20, 200, labelSize.height);
    
    //
    //    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    //    label.text = title;
    //    label.font = font;
    //    label.numberOfLines = 0;
    //    CGSize size = CGSizeMake(2000,2000);
    //    NSDictionary * dict = @{NSFontAttributeName : label.font};
    //    CGSize labelSize = [title boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    //
    ////    [label sizeToFit];
    //    CGFloat height = labelSize.height;
    //
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}


//给UILabel设置行间距和字间距
-(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = UILABEL_LINE_SPACE; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attributeStr;
}

//计算UILabel的高度(带有行间距的情况)
-(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = UILABEL_LINE_SPACE;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}

@end
