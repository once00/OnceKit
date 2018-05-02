//
//  OnceDocumentsTools.m
//  西北特产
//
//  Created by 曹绍奇 on 2018/1/29.
//  Copyright © 2018年 曹绍奇. All rights reserved.
//

#import "OnceDocumentsTools.h"

#define fileManager [NSFileManager defaultManager]
static NSMutableDictionary *wyFilePathDict_;
@implementation OnceDocumentsTools
+ (void)load
{
    wyFilePathDict_ = [NSMutableDictionary dictionary];
}

/**
 获取沙盒路径下Document目录
 
 @return filePath
 */
+ (NSString *)getDocumentFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//第一个常量NSDocumentDirectory表示正在查找沙盒Document目录的路径（如果参数为NSCachesDirectory则表示沙盒Cache目录），第二个常量NSUserDomainMask表明我们希望将搜索限制在应用的沙盒内；
    NSString *documentFilePath = paths.firstObject;//因为每一个应用只有一个Documents目录，所以这里取第一个和最后一个数据都是一样的
    return documentFilePath;
}
/**
 获取沙盒路径下cache文件夹路径
 
 @return filePath
 */
+ (NSString *)getCacheFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return paths.firstObject;
}

/**
 获取沙盒路径下tmp目录
 
 @return filePath
 */
+ (NSString *)getTmpFilePath
{
    NSString *tmpPath = NSTemporaryDirectory();
    return tmpPath;
}

/**
 保存文件到指定目录 默认路径为`Document`目录下的`key`文件夹
 
 @param object object
 @param key key
 */
+ (void)setCustomObject:(NSObject *)object forKey:(NSString *)key
{
    if (key == nil) { return; }
    NSString *documentFile = [self getDocumentFilePath];
    NSString *file = [documentFile stringByAppendingPathComponent:key];
    [self setCustomObject:object forKey:key filePath:file];
    
}

/**
 保存文件
 
 @param object 保存的对象·
 @param key 保存的key
 @param filePath 保存的文件路径
 */
+ (void)setCustomObject:(NSObject *)object forKey:(NSString *)key filePath:(NSString *)filePath
{
    if (filePath == nil || key == nil) { return; }
    //新建一块可变数据区(临时存储空间，以便随后写入文件，或者存放从磁盘读取的文件内容)
    NSMutableData *data = [NSMutableData data];
    //将数据区连接到NSKeyedArchiver对象
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    //开始存档对象 存档的数据都会存储到NSMutableData中 会调用对象的`encodeWithCoder`方法
    [archiver encodeObject:object forKey:key];
    
    //结束存档
    [archiver finishEncoding];
    
    //将存档的数据写入文件
    [data writeToFile:filePath atomically:YES];
    
    //存储路径
    wyFilePathDict_[key] = filePath;
}

/**
 获取保存对象的存储路径呢
 
 @param key 存储时的key
 @return 路径
 */
+ (NSString *)getCustomObjectFilePathWithKey:(NSString *)key
{
    if (![key isKindOfClass:[NSString class]]) {
        
        return nil;
    }
    
    return wyFilePathDict_[key];
}

/**
 获取保存在本地Document目录下的自定义对象
 
 @param key key
 @return object
 */
+ (id)getCustomObjectWithKey:(NSString *)key
{
    if (key == nil) { return nil; }
    NSString *documentFile = [self getDocumentFilePath];
    NSString *file = [documentFile stringByAppendingPathComponent:key];
    return [self getCustomObjectWithKey:key filePath:file];
}


/**
 获取保存在本地的自定义对象
 
 @param key 保存对象的key
 @param filePath 保存对象的路径
 @return object
 */
+ (id)getCustomObjectWithKey:(NSString *)key filePath:(NSString *)filePath
{
    if (key == nil || filePath == nil) { return nil; }
    
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    //反归档对象 会调用对象的`initWithCoder`方法
    id obj =  [unarchiver decodeObjectForKey:key];
    
    [unarchiver finishDecoding];
    return obj;
}
static dispatch_queue_t wy_clearCacheQueue() {
    
    return dispatch_queue_create("com.wy.clearCache", DISPATCH_QUEUE_SERIAL);
}

/**
 清除沙河路径的文件
 
 @param path 文件路径
 @param completion 完成之后的回调
 */
+ (void)clearCacheWithFilePath:(NSString *)path completion:(void(^)(BOOL result, NSError *error))completion
{
    
    NSFileManager *manager = [NSFileManager  defaultManager];
    
    if (![manager fileExistsAtPath:path]) {
        if (completion) {
            completion(YES, nil);
        }
        return ;
    }
    dispatch_async(wy_clearCacheQueue(), ^{
        NSError *error = nil;
        BOOL result = [manager removeItemAtPath:path error:&error];
        [manager createDirectoryAtPath:path
           withIntermediateDirectories:YES
                            attributes:nil
                                 error:NULL];
        
        
        if (completion) {
            completion(result, error);
        }
    });
}

static dispatch_queue_t wy_calculateFileSizeQueue() {
    static dispatch_queue_t wy_calculateFileSizeQueue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        wy_calculateFileSizeQueue = dispatch_queue_create("wy_calculateFileSizeQueue", DISPATCH_QUEUE_CONCURRENT);
    });
    
    return wy_calculateFileSizeQueue;
}

/**
 计算文件大小
 
 @param filePath 文件路径
 @param fileSize 文件大小
 */
+ (void )calculateFileSizeWithFilePath:(NSString *)filePath fileSize:(void(^)(unsigned long long size))fileSize
{
    
    // 总大小
    __block unsigned long long size = 0;
    NSFileManager *manager = [NSFileManager defaultManager];
    
    BOOL isDir = NO;
    BOOL exist = [manager fileExistsAtPath:filePath isDirectory:&isDir];
    
    // 判断路径是否存在
    if (!exist) {
        if (fileSize) {
            fileSize(size);
        }
        return;
    }
    
    
    //计算文件大小属于耗时操作,如果文件比较大,那么在主线程用此方法会卡住主线程,造成用户体验很差;所以,调用此方法应该放在子线程
    dispatch_async(wy_calculateFileSizeQueue(), ^{
        
        if (isDir) { // 是文件夹
            NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:filePath];
            for (NSString *subPath in enumerator) {
                NSString *fullPath = [filePath stringByAppendingPathComponent:subPath];
                size += [manager attributesOfItemAtPath:fullPath error:nil].fileSize;
                
            }
        }else{ // 是文件
            size += [manager attributesOfItemAtPath:filePath error:nil].fileSize;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (fileSize) {
                fileSize(size);
            }
        });
    });
}

/**
 计算文件大小
 
 @param filePath 文件路径
 @param fileSize 文件大小
 */
+ (void)fileSizeWithFilePath:(NSString *)filePath fileSize:(void(^)(NSString * size))fileSize
{
    // 总大小
    __block unsigned long long size = 0;
    __block NSString *sizeText = nil;
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 文件属性
    NSDictionary *attrs = [mgr attributesOfItemAtPath:filePath error:nil];
    // 如果这个文件或者文件夹不存在,或者路径不正确直接返回0;
    if (attrs == nil) {
        if (fileSize) {
            fileSize(sizeText);
        }
        return;
    }
    
    dispatch_async(wy_calculateFileSizeQueue(), ^{
        if ([attrs.fileType isEqualToString:NSFileTypeDirectory]) { // 如果是文件夹
            // 获得文件夹的大小  == 获得文件夹中所有文件的总大小
            NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:filePath];
            for (NSString *subpath in enumerator) {
                // 全路径
                NSString *fullSubpath = [filePath stringByAppendingPathComponent:subpath];
                // 累加文件大小
                size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
                
                if (size >= pow(10, 9)) { // size >= 1GB
                    sizeText = [NSString stringWithFormat:@"%.2fGB", size / pow(10, 9)];
                } else if (size >= pow(10, 6)) { // 1GB > size >= 1MB
                    sizeText = [NSString stringWithFormat:@"%.2fMB", size / pow(10, 6)];
                } else if (size >= pow(10, 3)) { // 1MB > size >= 1KB
                    sizeText = [NSString stringWithFormat:@"%.2fKB", size / pow(10, 3)];
                } else { // 1KB > size
                    sizeText = [NSString stringWithFormat:@"%zdB", size];
                }
                
            }
        } else { // 如果是文件
            size = attrs.fileSize;
            if (size >= pow(10, 9)) { // size >= 1GB
                sizeText = [NSString stringWithFormat:@"%.2fGB", size / pow(10, 9)];
            } else if (size >= pow(10, 6)) { // 1GB > size >= 1MB
                sizeText = [NSString stringWithFormat:@"%.2fMB", size / pow(10, 6)];
            } else if (size >= pow(10, 3)) { // 1MB > size >= 1KB
                sizeText = [NSString stringWithFormat:@"%.2fKB", size / pow(10, 3)];
            } else { // 1KB > size
                sizeText = [NSString stringWithFormat:@"%zdB", size];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (fileSize) {
                fileSize(sizeText);
            }
        });
    });
}
//获取path路径下文件夹大小
+ (NSString *)getCacheSizeWithFilePath:(NSString *)path
{
    
    //调试
#ifdef DEBUG
    //如果文件夹不存在或者不是一个文件夹那么就抛出一个异常
    //抛出异常会导致程序闪退，所以只在调试阶段抛出，发布阶段不要再抛了,不然极度影响用户体验
    BOOL isDirectory = NO;
    BOOL isExist = [fileManager fileExistsAtPath:path isDirectory:&isDirectory];
    if (!isExist || !isDirectory)
    {
        NSException *exception = [NSException exceptionWithName:@"fileError" reason:@"please check your filePath!" userInfo:nil];
        [exception raise];
        
    }
    NSLog(@"debug");
    //发布
#else
    NSLog(@"post");
#endif
    
    //获取“path”文件夹下面的所有文件
    NSArray *subpathArray= [fileManager subpathsAtPath:path];
    
    NSString *filePath = nil;
    NSInteger totleSize=0;
    
    for (NSString *subpath in subpathArray)
    {
        //拼接每一个文件的全路径
        filePath =[path stringByAppendingPathComponent:subpath];
        
        
        
        //isDirectory，是否是文件夹，默认不是
        BOOL isDirectory = NO;
        
        //isExist，判断文件是否存在
        BOOL isExist = [fileManager fileExistsAtPath:filePath isDirectory:&isDirectory];
        
        //判断文件是否存在，不存在的话过滤
        //如果存在的话，那么是否是文件夹，是的话也过滤
        //如果文件既存在又不是文件夹，那么判断它是不是隐藏文件，是的话也过滤
        //过滤以上三个情况后，就是一个文件夹里面真实的文件的总大小
        //以上判断目的是忽略不需要计算的文件
        if (!isExist || isDirectory || [filePath containsString:@".DS"]) continue;
        //NSLog(@"%@",filePath);
        //指定路径，获取这个路径的属性
        //attributesOfItemAtPath:需要传文件夹路径
        //但是attributesOfItemAtPath 只可以获得文件属性，不可以获得文件夹属性，这个也就是需要for-in遍历文件夹里面每一个文件的原因
        NSDictionary *dict=   [fileManager attributesOfItemAtPath:filePath error:nil];
        
        NSInteger size=[dict[@"NSFileSize"] integerValue];
        totleSize+=size;
    }
    
    //将文件夹大小转换为 M/KB/B
    NSString *totleStr = nil;
    
    if (totleSize > 1000 * 1000)
    {
        totleStr = [NSString stringWithFormat:@"%.1fM",totleSize / 1000.0f /1000.0f];
    }else if (totleSize > 1000)
    {
        totleStr = [NSString stringWithFormat:@"%.1fKB",totleSize / 1000.0f ];
        
    }else
    {
        totleStr = [NSString stringWithFormat:@"%.1fB",totleSize / 1.0f];
    }
    
    return totleStr;
    
    
}


//清除path文件夹下缓存大小
+ (BOOL)clearCacheWithFilePath:(NSString *)path
{
    
    //拿到path路径的下一级目录的子文件夹
    NSArray *subpathArray = [fileManager contentsOfDirectoryAtPath:path error:nil];
    
    NSString *message = nil;
    NSError *error = nil;
    NSString *filePath = nil;
    
    for (NSString *subpath in subpathArray)
    {
        filePath =[path stringByAppendingPathComponent:subpath];
        //删除子文件夹
        [fileManager removeItemAtPath:filePath error:&error];
        if (error) {
            message = [NSString stringWithFormat:@"%@这个路径的文件夹删除失败了，请检查后重新再试",filePath];
            return NO;
            
        }else {
            message = @"成功了";
        }
        
    }
    NSLog(@"%@",message);
    
    return YES;
    
}

@end
