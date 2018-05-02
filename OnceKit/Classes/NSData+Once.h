//
//  NSData+Once.h
//  AFNetworking
//
//  Created by 曹绍奇 on 2018/1/4.
//

#import <Foundation/Foundation.h>

@interface NSData (Once)
/**
 *  图片压缩
 *
 *  @param sourceImage    image
 */
+(NSData *)zipNSDataWithImage:(UIImage *)sourceImage;

@end
