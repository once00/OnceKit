//
//  OnceCommonMacro.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#ifndef OnceCommonMacro_h
#define OnceCommonMacro_h

/**
 *  颜色相关
 */
//颜色
#define DSRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]//随机色
#define RGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]//16进制颜色
#define RGB_A(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]//RGB带透明度颜色


/**
 *  系统先关
 */
#define DSFourInch ([UIScreen mainScreen].bounds.size.height >= 568.0)//是否为4inch
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)//是否为iOS7
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)//是否为iOS8及以上系统
#define iOS9 ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)//是否为iOS9及以上系统
#define iOS10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)//是否为iOS8及以上系统
#define iOS11 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)//是否为iOS8及以上系统
/// 获取手机类型
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)//4
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)//5
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)//6
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)//6p
#define IOS_System [[UIDevice currentDevice] systemVersion]//// 获取手机系统

/**
 *  适配先关
 */
//距离屏幕两边
#define HG_EDGE 12
#define O_WIDTH(s) s * [[UIScreen mainScreen] bounds].size.width / 640
#define O_HEIGHT(s) s * [[UIScreen mainScreen] bounds].size.height / 1136
#define FRAME(x,y,width,height) (O_WIDTH(x)),(O_HEIGHT(y)),(O_WIDTH(width)),(O_HEIGHT(height))
#define CONTROL_W(stance) ((HG_WIDTH/375) * (float)stance)// 适配屏幕比例
#define RESOURCE_PATH [[NSBundle mainBundle] resourcePath]// 适配屏幕比例
#define SCALE [[UIScreen mainScreen] bounds].size.width/375
#define HEIGHTNEW [UIScreen mainScreen].bounds.size.height
#define WeakSelf __weak typeof(self) wself = self
#define WEAKSELF(A) __weak typeof(A) weakSelf = A;
#define HG_Size CGSize Size = [[UIScreen mainScreen] bounds].size// 获取屏幕宽高
#define HG_WIDTH  [[UIScreen mainScreen] bounds].size.width// 获取屏幕宽
#define HG_HEIGHT [[UIScreen mainScreen] bounds].size.height// 获取屏幕宽高
#define CenterOriginBInA(A,B) (A-B)/2//控件居中位置
#define CircleDegreeToRadian(d) ((d)*M_PI)/180.0//角度转换为弧度
#define StatusRectHH [UIApplication sharedApplication].statusBarFrame.size.height//状态栏高度
#define NavRectHH self.navigationController.navigationBar.frame.size.height//标题栏高度
#define SafeAreaTopHeight (kWJScreenHeight == 812.0 ? 88 : 64)//导航栏高度
#define NavHeight (NavRectHH+StatusRectHH) //导航栏高度
/// 底部宏，吃一见长一智吧，别写数字了(iphonex适配)
#define SafeAreaBottomHeight (kWJScreenHeight == 812.0 ? 34 : 0)
/// 第一个参数是当下的控制器适配iOS11 一下的，第二个参数表示scrollview或子类
#define AdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}
/// 高度系数 812.0 是iPhoneX的高度尺寸，667.0表示是iPhone 8 的高度，如果你觉的它会变化，那我也很无奈
#define kWJHeightCoefficient (kWJScreenHeight == 812.0 ? 667.0/667.0 : kWJScreenHeight/667.0)

#define NAVBAR_COLORCHANGE_POINT (-IMAGE_HEIGHT + NAV_HEIGHT*2)
#define NAV_HEIGHT 64
#define IMAGE_HEIGHT 260
#define SCROLL_DOWN_LIMIT 100
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define LIMIT_OFFSET_Y -(IMAGE_HEIGHT + SCROLL_DOWN_LIMIT)

/**
 *  图片相关
 */
#define MainImageName(name) [UIImage imageNamed :name]// 自定义视图 图片路径



/**
 *  日至输出
 */
#ifdef DEBUG
#   define DDLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define DDLogFunction  NSLog((@"%s [Line %d] " ), __PRETTY_FUNCTION__, __LINE__);
//#   define DDLog NSLog(__VA_ARGS__)
#else
#   define DDLog(fmt, ...);
#   define DDLogFunction
#endif


//将NSUserDefaults的实例化定义成宏
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]


/**
 *  NSNotificationCenter
 */
#define NSREMOVENotification [[NSNotificationCenter defaultCenter]removeObserver:self]
#define NSPOSTNotification(name,obj,userinfo) [[NSNotificationCenter defaultCenter] postNotificationName:name object:self userInfo:userinfo]
#define NSAddObjectrver(selectorStr,keyName) [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(selectorStr) name:keyName object:nil]















#endif /* OnceCommonMacro_h */
