//
//  NSDictionary+Once.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Once)

-(NSString *)DWStringForKey:(id)key;
-(NSArray *)DWArrayForKey:(id)key;
-(NSDictionary *)DWDictionaryForKey:(id)key;
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end
