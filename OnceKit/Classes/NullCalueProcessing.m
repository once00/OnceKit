//
//  NullCalueProcessing.m
//  excellentpractice
//
//  Created by 曹绍奇 on 2018/9/29.
//  Copyright © 2018 caoqin. All rights reserved.
//

#import "NullCalueProcessing.h"

@implementation NullCalueProcessing

NSString *SafeValue(id value) {
    if(!value) {
        return @"";
    }else if ([value isKindOfClass:[NSString class]]) {
        if ([value isEqualToString:@"<null>"]) {
            return @"";
        }
        if ([value isEqualToString:@"(null)"]) {
            return @"";
        }
        return value;
    }else {
        return [NSString stringWithFormat:@"%@",value];
    }
}

@end
