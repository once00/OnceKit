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
/**
 *  字典转JSON
 *  @param  jsonString    json数据
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 *  字典转Data
 *  @param  dict    字典数据
 */
+(NSData *)returnDataWithDictionary:(NSDictionary *)dict;

/**
 *  路径文件转字典
 *  @param  path    路径文件
 */
+(NSDictionary *)returnDictionaryWithDataPath:(NSString *)path;

@end
