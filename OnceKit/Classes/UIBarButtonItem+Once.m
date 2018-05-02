//
//  UIBarButtonItem+Once.m
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import "UIBarButtonItem+Once.h"
#import "UIView+Once.h"

#define iOS11 ([[UIDevice currentDevice].systemVersion doubleValue] >= 11.0)
#define HG_WIDTH  [[UIScreen mainScreen] bounds].size.width

@implementation UIBarButtonItem (Once)

/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(UIImage *)image highImage:(UIImage *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //设置图片
    //    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    //    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    // 设置尺寸
    btn.size = CGSizeMake(40, 40);
    
    //    btn.size = btn.currentImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title color:(UIColor *)color
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //设置标题
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize: 16.f];
    [btn setTitleColor:color forState:UIControlStateNormal];
    if (iOS11) {
        btn.contentHorizontalAlignment =UIControlContentHorizontalAlignmentRight;
        [btn setImageEdgeInsets:UIEdgeInsetsMake(-10,0,0, -5 *HG_WIDTH /375.0)];
    }
    btn.size = CGSizeMake(40, 40);
    // 右边添加个保存按钮
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


@end
