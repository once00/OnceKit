//
//  UILabel+UILabel_ChangeLineSpaceAndWordSpace.h
//  西北招商网云管理系统
//
//  Created by 曹绍奇 on 2017/7/29.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (UILabel_ChangeLineSpaceAndWordSpace)
/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;


@end
