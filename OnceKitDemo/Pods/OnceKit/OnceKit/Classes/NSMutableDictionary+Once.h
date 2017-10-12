//
//  NSMutableDictionary+Once.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Once)
-(void)DWSetObject:(id)anObject forKey:(id<NSCopying>)aKey;

@end
