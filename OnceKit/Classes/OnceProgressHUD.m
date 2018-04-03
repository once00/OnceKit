//
//  OnceProgressHUD.m
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import "OnceProgressHUD.h"

#define kSystemFontOfSize(size) [UIFont systemFontOfSize:size]

@implementation OnceProgressHUD

+ (instancetype)showMessage:(NSString *)message detail:(NSString *)detail showView:(UIView *)view img:(NSString *)imgName time:(float)time aplhaBackground:(BOOL)bg isAutoDismis:(BOOL)dismiss
{
    
    OnceProgressHUD *hud;
    hud.tag=10086;
    if (view==nil)
    {
        hud = [OnceProgressHUD showHUDAddedTo:kkeywundowsView animated:YES];
    }
    else
    {
        hud = [OnceProgressHUD showHUDAddedTo:view animated:YES];
    }
    
    //    hud.labelText = message;
    hud.label.text=message;
    
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", imgName]]];
    
    hud.mode = MBProgressHUDModeCustomView;
    
    //    hud.labelFont = kSystemFontOfSize(15);
    hud.label.font=kSystemFontOfSize(15);
    
    hud.removeFromSuperViewOnHide = YES;
    
    if (detail)
    {
        //        hud.detailsLabelText = detail;
        hud.detailsLabel.text=detail;
    }
    
    if (bg)
    {
        hud.dimBackground = YES;
        hud.animationType = MBProgressHUDAnimationFade;
    }
    else
    {
        hud.animationType = MBProgressHUDAnimationZoomOut;
    }
    
    if (dismiss)
    {
        // 1秒之后再消失
//        [hud hide:YES afterDelay:time];
        [hud hideAnimated:YES afterDelay:time];
    }
    
    return hud;
    
}





+ (void)showProgressWithMessage:(NSString *)message whileExecutingBlock:(ExecutingBlock)block forView:(UIView *)View type:(OnceProgressHUDMode)type completion:(ExecutingBlock)completion
{
    
    OnceProgressHUD *hud = [OnceProgressHUD showHUDAddedTo:View animated:YES];
    
    //    hud.labelText = message;
    hud.label.text=message;
    
    switch (type)
    {
        case OnceProgressHUDModeDeterminate:
        {
            hud.mode = MBProgressHUDModeDeterminate;
        }
            break;
        case OnceProgressHUDModeAnnularDeterminate:
        {
            hud.mode = MBProgressHUDModeAnnularDeterminate;
        }
            break;
        case OnceProgressHUDModeDeterminateHorizontalBar:
        {
            hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
        }
            break;
        default:
            break;
    }
    
    
    //    hud.labelFont = kSystemFontOfSize(15);
    hud.label.font=kSystemFontOfSize(15);
    hud.progress = 0.0;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud showAnimated:YES whileExecutingBlock:^{
        block(hud);
    } completionBlock:^{
        completion(hud);
    }];
    
    
}


/**
 *  ////////////////HUD加载在KeyWindow上/////////////////////////////////////
 *
 */

/**
 *  快速提示消息
 *
 *  @param message 消息
 */
+ (void)showMessage:(NSString *)message isShowBlackBackground:(BOOL)isShowBlackBackground
{
    OnceProgressHUD *hud = [OnceProgressHUD showMessage:message detail:nil showView:nil img:nil time:0.0 aplhaBackground:isShowBlackBackground isAutoDismis:NO];
    hud.mode = MBProgressHUDModeIndeterminate;
}

/**
 *  快速提示消息
 *
 *  @param message 消息
 
 *  @param Detail 描述
 */
+ (void)showMessage:(NSString *)message Detail:(NSString *)detail isShowBlackBackground:(BOOL)isShowBlackBackground
{
    OnceProgressHUD *hud = [OnceProgressHUD showMessage:message detail:detail showView:nil img:nil time:0.0 aplhaBackground:isShowBlackBackground isAutoDismis:NO];
    hud.mode = MBProgressHUDModeIndeterminate;
}

/**
 *  显示单个菊花
 */
+ (void)showSingleHudIsShowBlackground:(BOOL)isShow
{
    OnceProgressHUD *hud = [OnceProgressHUD showMessage:nil detail:nil showView:nil img:nil time:0.0 aplhaBackground:isShow isAutoDismis:NO];
    hud.mode = MBProgressHUDModeIndeterminate;
}

/**
 *  显示菊花
 *
 *  @param error 错误信息
 */
+ (void)showError:(NSString *)error isShowBlackBackground:(BOOL)isShowBlackBackground
{
    [OnceProgressHUD showMessage:error detail:nil showView:nil img:@"error.png" time:1.0 aplhaBackground:isShowBlackBackground isAutoDismis:YES];
}

/**
 *  显示菊花
 *
 *  @param Success 成功消息
 */
+ (void)showSuccess:(NSString *)Success isShowBlackBackground:(BOOL)isShowBlackBackground
{
    [OnceProgressHUD showMessage:Success detail:nil showView:nil img:@"success.png" time:1.0 aplhaBackground:isShowBlackBackground isAutoDismis:YES];
}

/**
 *  隐藏
 */
+ (void)hidden
{
    [OnceProgressHUD hideHUDForView:kkeywundowsView animated:YES];
    [[[UIApplication sharedApplication].keyWindow viewWithTag:10086] removeFromSuperview];
}



/**
 *  ////////////////HUD加载在View上/////////////////////////////////////
 *
 */

/**
 *  显示菊花
 *
 *  @param message               消息
 *  @param view                  在哪个View上显示
 *  @param isShowBlackBackground 是否显示黑色背景
 */
+ (void)showMessage:(NSString *)message forView:(UIView *)view isShowBlackBackground:(BOOL)isShowBlackBackground
{
    OnceProgressHUD *hud = [OnceProgressHUD showMessage:message detail:nil showView:view img:nil time:0.0 aplhaBackground:isShowBlackBackground isAutoDismis:NO];
    hud.mode = MBProgressHUDModeIndeterminate;
}


/**
 *  显示菊花
 *
 *  @param message               消息
 *  @param detail                描述
 *  @param view                  在哪个View上显示
 *  @param isShowBlackBackground 是否显示黑色背景
 */
+ (void)showMessage:(NSString *)message Detail:(NSString *)detail forView:(UIView *)view isShowBlackBackground:(BOOL)isShowBlackBackground
{
    OnceProgressHUD *hud = [OnceProgressHUD showMessage:message detail:detail showView:view img:nil time:0.0 aplhaBackground:isShowBlackBackground isAutoDismis:NO];
    hud.mode = MBProgressHUDModeIndeterminate;
}



/**
 *    显示单个菊花
 *
 *  @param isShow 是否显示背景
 *  @param view   在哪个View上显示
 */
+ (void)showSingleHudIsShowBlackground:(BOOL)isShow forView:(UIView *)view
{
    OnceProgressHUD *hud = [OnceProgressHUD showMessage:nil detail:nil showView:view img:nil time:0.0 aplhaBackground:isShow isAutoDismis:NO];
    hud.mode = MBProgressHUDModeIndeterminate;
}

/**
 *  显示菊花
 *
 *  @param error 错误信息
 */

/**
 *  显示错误信息
 *
 *  @param error                 错误信息
 *  @param view                  在哪个View上显示
 *  @param isShowBlackBackground 是否显示黑色背景
 */
+ (void)showError:(NSString *)error forView:(UIView *)view isShowBlackBackground:(BOOL)isShowBlackBackground
{
    [OnceProgressHUD showMessage:error detail:nil showView:view img:@"error.png" time:1.0 aplhaBackground:isShowBlackBackground isAutoDismis:YES];
}


/**
 *  显示菊花
 *
 *  @param Success               成功
 *  @param view                  在哪个View上显示
 *  @param isShowBlackBackground 是否显示黑色背景
 */
+ (void)showSuccess:(NSString *)Success forView:(UIView *)view isShowBlackBackground:(BOOL)isShowBlackBackground
{
    [OnceProgressHUD showMessage:Success detail:nil showView:view img:@"success.png" time:1.0 aplhaBackground:isShowBlackBackground isAutoDismis:YES];
}



/**
 *  隐藏
 *
 *  @param view hud显示的View
 */
+ (void)hiddenForView:(UIView *)view
{
    [OnceProgressHUD hideHUDForView:view animated:YES];
}

@end
