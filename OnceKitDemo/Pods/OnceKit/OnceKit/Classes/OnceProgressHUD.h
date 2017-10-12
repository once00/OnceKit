//
//  OnceProgressHUD.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>


#define kKeyWindowView [[UIApplication sharedApplication].windows lastObject]
#define kkeywundowsView [UIApplication sharedApplication].delegate.window

/** 快捷方式 */

/********************************************HUD加载在KeyWindow上***************************/

//isShow == YES 带半黑色背景
//isShow == NO 不带半黑色背景

/**显示消息*/
#define kShowMessage(message,isShow) [OnceProgressHUD showMessage:message isShowBlackBackground:isShow]

/**显示消息 带描述 */
#define kShowMessageAndDetail(message,detail,isShow) [OnceProgressHUD showMessage:message Detail:detail isShowBlackBackground:isShow]

/**显示单个菊花 */
#define kShowSingleHud(isShow) [OnceProgressHUD showSingleHudIsShowBlackground:isShow]

/**显示成功提示 */
#define kShowSuccess(success,isShow) [OnceProgressHUD showSuccess:success isShowBlackBackground:isShow]

/**显示错误信息提示 */
#define kShowError(error,isShow) [OnceProgressHUD showError:error isShowBlackBackground:isShow]

#define kHUDHidden [OnceProgressHUD hidden]


/********************************************HUD加载在View上***************************/
//////////////////不带半黑色背景//////////////////////////////

/**显示消息*/
#define kShowMessageForView(message,View,isShow) [OnceProgressHUD showMessage:message forView:View isShowBlackBackground:isShow]

/**显示消息 带描述 */
#define kShowMessageAndDetailForView(message,detail,View,isShow) [OnceProgressHUD showMessage:message Detail:detail forView:View isShowBlackBackground:isShow]

/**显示单个菊花 */
#define kShowSingleHudForView(View,isShow) [OnceProgressHUD showSingleHudIsShowBlackground:isShow forView:View]

/**显示成功提示 */
#define kShowSuccessForView(success,View,isShow) [OnceProgressHUD showSuccess:success forView:View isShowBlackBackground:isShow]

/**显示错误信息提示 */
#define kShowErrorForView(error,View,isShow) [OnceProgressHUD showError:error forView:View isShowBlackBackground:isShow]

#define kHUDHiddenForView(View) [OnceProgressHUD hiddenForView:View]

@class MBProgressHUD;
typedef void(^myBlock)(void);
typedef void(^ExecutingBlock)(MBProgressHUD *hud);

typedef NS_ENUM(NSInteger, OnceProgressHUDMode) {
    
    OnceProgressHUDModeDeterminate,
    
    OnceProgressHUDModeAnnularDeterminate,
    
    OnceProgressHUDModeDeterminateHorizontalBar
    
    
};

@interface OnceProgressHUD : MBProgressHUD


////////////////HUD加载在KeyWindow上/////////////////////////////////////
/**
 *  快速提示消息
 *
 *  @param message 消息
 *  @param isShowBlackBackground 是否显示黑背景
 */
+ (void)showMessage:(NSString *)message isShowBlackBackground:(BOOL)isShowBlackBackground;


/**
 *  快速提示消息
 *
 *  @param message 消息
 
 *  @param detail 描述
 */
+ (void)showMessage:(NSString *)message Detail:(NSString *)detail isShowBlackBackground:(BOOL)isShowBlackBackground;


/**
 *  显示单个菊花
 *
 *  @param isShow 是否显示黑色背景
 */
+ (void)showSingleHudIsShowBlackground:(BOOL)isShow;


/**
 *  显示菊花
 *
 *  @param error 错误信息
 
 *  @param isShowBlackBackground 是否显示黑背景
 
 */
+ (void)showError:(NSString *)error isShowBlackBackground:(BOOL)isShowBlackBackground;


/**
 *  显示菊花
 *
 *  @param Success 成功消息
 
 *  @param isShowBlackBackground 是否显示黑背景
 
 */
+ (void)showSuccess:(NSString *)Success isShowBlackBackground:(BOOL)isShowBlackBackground;


/**
 *     隐藏Hud
 */
+ (void)hidden;



////////////////HUD加载在View上/////////////////////////////////////
/**
 *  显示菊花
 *
 *  @param message               消息
 *  @param view                  在哪个View上显示
 *  @param isShowBlackBackground 是否显示黑色背景
 */
+ (void)showMessage:(NSString *)message forView:(UIView *)view isShowBlackBackground:(BOOL)isShowBlackBackground;



/**
 *  显示菊花
 *
 *  @param message               消息
 *  @param detail                描述
 *  @param view                  在哪个View上显示
 *  @param isShowBlackBackground 是否显示黑色背景
 */
+ (void)showMessage:(NSString *)message Detail:(NSString *)detail forView:(UIView *)view isShowBlackBackground:(BOOL)isShowBlackBackground;



/**
 *    显示单个菊花
 *
 *  @param isShow 是否显示背景
 *  @param view   在哪个View上显示
 */
+ (void)showSingleHudIsShowBlackground:(BOOL)isShow forView:(UIView *)view;



/**
 *  显示错误信息
 *
 *  @param error                 错误信息
 *  @param view                  在哪个View上显示
 *  @param isShowBlackBackground 是否显示黑色背景
 */
+ (void)showError:(NSString *)error forView:(UIView *)view isShowBlackBackground:(BOOL)isShowBlackBackground;



/**
 *  显示菊花
 *
 *  @param Success               成功
 *  @param view                  在哪个View上显示
 *  @param isShowBlackBackground 是否显示黑色背景
 */
+ (void)showSuccess:(NSString *)Success forView:(UIView *)view isShowBlackBackground:(BOOL)isShowBlackBackground;



/**
 *  隐藏
 *
 *  @param view hud显示的View
 */
+ (void)hiddenForView:(UIView *)view;


/**
 *  显示进度条p
 *
 *  @param message    加载提示信息
 *  @param block      加载的时候可以一直执行一个任务
 *  @param View       在哪个View上显示
 *  @param type       类型
 *  @param completion 完成是回调
 *
 */
+ (void)showProgressWithMessage:(NSString *)message whileExecutingBlock:(ExecutingBlock)block forView:(UIView *)View type:(OnceProgressHUDMode)type completion:(ExecutingBlock)completion;


@end
