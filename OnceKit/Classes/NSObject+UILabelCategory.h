//
//  NSObject+UILabelCategory.h
//  xiwang
//
//  Created by 曹绍奇 on 2017/6/7.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 - (void)buildLabelOne
 {
 UILabel *labelOne = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 200, 50)];
 labelOne.text = @"这是labelOne的高度自适应这是labelOne的高度自适应这是labelOne的高度自适应这是labelOne的高度自适应";
 labelOne.backgroundColor = [UIColor grayColor];
 labelOne.font = [UIFont systemFontOfSize:20];
 labelOne.numberOfLines = 0;
 CGFloat height = [UILabel getHeightByWidth:labelOne.frame.size.width title:labelOne.text font:labelOne.font];
 labelOne.frame = CGRectMake(10, 30, 200, height);
 [self.view addSubview:labelOne];
 
 }
 
 #pragma mark - labelTwo  SizeToFitWidth
 - (void)buildLabelTwo
 {
 UILabel *labelTwo = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 50, 100)];
 labelTwo.text = @"这是labelTwo的宽度自适应这是labelTwo的宽度自适应这是labelTwo的宽度自适应";
 labelTwo.backgroundColor = [UIColor cyanColor];
 labelTwo.font = [UIFont systemFontOfSize:20];
 CGFloat width = [UILabel getWidthWithTitle:labelTwo.text font:labelTwo.font];
 labelTwo.frame = CGRectMake(10, 300, width, 100);
 [self.view addSubview:labelTwo];
 }
 **/

@interface NSObject (UILabelCategory)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

@end
