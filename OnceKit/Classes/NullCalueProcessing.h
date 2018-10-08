//
//  NullCalueProcessing.h
//  excellentpractice
//
//  Created by 曹绍奇 on 2018/9/29.
//  Copyright © 2018 caoqin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NullCalueProcessing : NSObject

/**
 * 过滤value中的空值 -----引入头文件后，在需要的地方直接这样写SafeValue(你需要判断过滤的值)
 */
NSString *SafeValue(id value);

@end

NS_ASSUME_NONNULL_END
