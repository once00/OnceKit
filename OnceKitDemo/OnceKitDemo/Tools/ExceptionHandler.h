//
//  ExceptionHandler.h
//  西北招商网云管理系统
//
//  Created by 曹绍奇 on 2017/8/30.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//
//捕获异常
#import <Foundation/Foundation.h>

@interface ExceptionHandler : NSObject{
    BOOL dismissed;
}

@end
void HandleException(NSException *exception);
void SignalHandler(int signal);


void InstallUncaughtExceptionHandler(void);
