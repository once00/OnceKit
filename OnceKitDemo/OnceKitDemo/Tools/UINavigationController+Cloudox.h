//
//  UINavigationController+Cloudox.h
//  西北招商网云管理系统
//
//  Created by 曹绍奇 on 2017/7/12.
//  Copyright © 2017年 曹绍奇. All rights reserved.

#import <UIKit/UIKit.h>

@interface UINavigationController (Cloudox) <UINavigationBarDelegate, UINavigationControllerDelegate>
@property (copy, nonatomic) NSString *cloudox;
- (void)setNeedsNavigationBackground:(CGFloat)alpha;
@end
