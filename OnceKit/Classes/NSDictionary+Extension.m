//
//  NSDictionary+Extension.m
//  xiwang
//
//  Created by 曹绍奇 on 16/9/27.
//  Copyright © 2016年 gxz. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonStr
{
    if (jsonStr == nil) {
        return nil;
    }
    NSData* jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if (err) {
//        ICLog(@"json serialize failue");
        return nil;
    }
    return dic;
}

- (NSString*)jsonString
{
    NSData* infoJsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    NSString* json = [[NSString alloc] initWithData:infoJsonData encoding:NSUTF8StringEncoding];
    return json;
}

//字典转data
+(NSData *)returnDataWithDictionary:(NSDictionary *)dict
{
    NSMutableData * data = [[NSMutableData alloc] init];
    NSKeyedArchiver * archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:dict forKey:@"talkData"];
    [archiver finishEncoding];
    
//    [data autorelease];
//    [archiver autorelease];
    
    return data;
}
//路径文件转dictonary
+(NSDictionary *)returnDictionaryWithDataPath:(NSString *)path
{
    NSData * data = [[NSMutableData alloc] initWithContentsOfFile:path];
    NSKeyedUnarchiver * unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSDictionary * myDictionary = [unarchiver decodeObjectForKey:@"talkData"];
    [unarchiver finishDecoding];
    //    NSLog(@"%@", myDictionary);
//    [unarchiver autorelease];
//    [data autorelease];
    
    return myDictionary;
}




@end
