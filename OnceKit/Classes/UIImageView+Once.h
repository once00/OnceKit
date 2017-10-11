//
//  UIImageView+Once.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemOnce.h"

@interface UIImageView (Once)
+(UIImageView*)imageViewWithFrame:(TCGRect)frame
                            image:(NSString*)imageName;
@end
