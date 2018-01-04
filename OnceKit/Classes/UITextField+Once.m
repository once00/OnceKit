//
//  UITextField+Once.m
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import "UITextField+Once.h"

#define IS_IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0)

@implementation UITextField (Once)
+(UITextField*)textFieldWithFrame:(TCGRect)frame
                     keyboardType:(UITextBorderStyle)borderStyle
                placeholderString:(NSString*)placeholderString
            placeholderStringFont:(CGFloat)placeFont
                 placeholderColor:(UIColor*)placeholderColor
                        textColor:(UIColor*)textColor
                         textFont:(CGFloat)textFont
                    textAlignment:(NSTextAlignment)alignment{
    
    
    UITextField* field=[[UITextField alloc]initWithFrame:frame];
    field.keyboardType=UITextBorderStyleNone;
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:placeholderString];
    //    [placeholder addAttribute:NSForegroundColorAttributeName
    //                        value:placeholderColor
    //                        range:NSMakeRange(0, placeholderString.length)];
    //    [placeholder addAttribute:NSFontAttributeName
    //                        value:[UIFont systemFontOfSize:placeFont*SCALE]
    //                        range:NSMakeRange(0, placeholderString.length)];
    //
    
    UIFont *fontP ;
    IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:placeFont*SCALE] ): (fontP = [UIFont systemFontOfSize:placeFont*SCALE]);
    
    
    [placeholder setAttributes:[NSDictionary dictionaryWithObjectsAndKeys: placeholderColor,
                                NSForegroundColorAttributeName,
                                fontP,
                                NSFontAttributeName, nil] range:NSMakeRange(0, placeholderString.length)];
    
    UIFont*textFontP;
    IS_IOS9 ?( textFontP = [UIFont fontWithName:@"PingFangSC-Regular" size:textFont*SCALE] ): (textFontP = [UIFont systemFontOfSize:textFont*SCALE]);
    
    field.font=textFontP;
    
    
    field.attributedPlaceholder = placeholder;
    field.textColor=textColor;
    field.textAlignment = alignment;
    return field;
}
+(UITextField*)textFieldWithkeyboardType:(UITextBorderStyle)borderStyle
                       placeholderString:(NSString*)placeholderString
                   placeholderStringFont:(CGFloat)placeFont
                        placeholderColor:(UIColor*)placeholderColor
                               textColor:(UIColor*)textColor
                                textFont:(CGFloat)textFont
                           textAlignment:(NSTextAlignment)alignment{
    UITextField* field=[[UITextField alloc]init];
    field.keyboardType=UITextBorderStyleNone;
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:placeholderString];
    //    [placeholder addAttribute:NSForegroundColorAttributeName
    //                        value:placeholderColor
    //                        range:NSMakeRange(0, placeholderString.length)];
    //    [placeholder addAttribute:NSFontAttributeName
    //                        value:[UIFont systemFontOfSize:placeFont*SCALE]
    //                        range:NSMakeRange(0, placeholderString.length)];
    //
    
    UIFont *fontP ;
    IS_IOS9 ?( fontP = [UIFont fontWithName:@"PingFangSC-Regular" size:placeFont*SCALE] ): (fontP = [UIFont systemFontOfSize:placeFont*SCALE]);
    
    
    [placeholder setAttributes:[NSDictionary dictionaryWithObjectsAndKeys: placeholderColor,
                                NSForegroundColorAttributeName,
                                fontP,
                                NSFontAttributeName, nil] range:NSMakeRange(0, placeholderString.length)];
    
    UIFont*textFontP;
    IS_IOS9 ?( textFontP = [UIFont fontWithName:@"PingFangSC-Regular" size:textFont*SCALE] ): (textFontP = [UIFont systemFontOfSize:textFont*SCALE]);
    
    field.font=textFontP;
    
    
    field.attributedPlaceholder = placeholder;
    field.textColor=textColor;
    field.textAlignment = alignment;
    return field;
}
@end
