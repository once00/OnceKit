//
//  NSMutableDictionary+Once.m
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import "NSMutableDictionary+Once.h"

@implementation NSMutableDictionary (Once)
-(void)DWSetObject:(id)anObject forKey:(id<NSCopying>)aKey;
{
    if (anObject == nil) {
        return;
    }
    [self setObject:anObject forKey:aKey];
}
@end
