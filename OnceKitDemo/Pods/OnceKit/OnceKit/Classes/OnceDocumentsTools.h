//
//  OnceDocumentsTools.h
//  西北特产
//
//  Created by 曹绍奇 on 2018/1/29.
//  Copyright © 2018年 曹绍奇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OnceDocumentsTools : NSObject

/**
 获取沙盒路径下cache文件夹路径
 
 @return filePath
 */
+ (NSString *)getCacheFilePath;

/**
 获取沙盒路径下tmp目录
 
 @return filePath
 */
+ (NSString *)getTmpFilePath;

/**
 获取沙盒路径下Document目录
 
 @return filePath
 */
+ (NSString *)getDocumentFilePath;

/**
 保存文件到指定目录 默认路径为`Document`目录下的`key`文件夹
 
 @param object object
 @param key key
 */
+ (void)setCustomObject:(NSObject *)object forKey:(NSString *)key;

/**
 保存文件
 
 @param object 保存的对象·
 @param key 保存的key
 @param filePath 保存的文件路径
 */
+ (void)setCustomObject:(NSObject *)object forKey:(NSString *)key filePath:(NSString *)filePath;

/**
 获取保存在本地Document目录下的自定义对象
 
 @param key key
 @return object
 */
+ (id)getCustomObjectWithKey:(NSString *)key;

/**
 获取保存在本地的自定义对象
 
 @param key 保存对象的key
 @param filePath 保存对象的路径
 @return object
 */
+ (id)getCustomObjectWithKey:(NSString *)key filePath:(NSString *)filePath;


/**
 获取保存对象的存储路径呢
 
 @param key 存储时的key
 @return 路径
 */
+ (NSString *)getCustomObjectFilePathWithKey:(NSString *)key;

/**
 清除沙河路径的文件
 
 @param path 文件路径
 @param completion 完成之后的回调
 */
+ (void)clearCacheWithFilePath:(NSString *)path completion:(void(^)(BOOL result, NSError *error))completion;

/**
 计算文件大小
 
 @param filePath 文件路径
 @param fileSize 文件大小
 */
+ (void )calculateFileSizeWithFilePath:(NSString *)filePath fileSize:(void(^)(unsigned long long size))fileSize;


/**
 计算文件大小
 
 @param filePath 文件路径
 @param fileSize 文件大小 字符串类型，有单位（db，KB，M，G）
 */
+ (void)fileSizeWithFilePath:(NSString *)filePath fileSize:(void(^)(NSString * size))fileSize;

/**
 *  @author li bo, 16/05/29
 *
 *  获取path路径文件夹的大小
 *
 *  @param path 要获取大小的文件夹全路径
 *
 *  @return 返回path路径文件夹的大小
 */
+ (NSString *)getCacheSizeWithFilePath:(NSString *)path;

/**
 *  @author li bo, 16/05/29
 *
 *  清除path路径文件夹的缓存
 *
 *  @param path  要清除缓存的文件夹全路径
 *
 *  @return 是否清除成功
 */
+ (BOOL)clearCacheWithFilePath:(NSString *)path;

@end
