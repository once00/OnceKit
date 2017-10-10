//
//  NSObject+UILabelCategory.m
//  xiwang
//
//  Created by 曹绍奇 on 2017/6/7.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import "NSObject+UILabelCategory.h"

@implementation NSObject (UILabelCategory)


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
