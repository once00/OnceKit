//
//  OnceNavTools.m
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import "OnceNavTools.h"
#import "UIBarButtonItem+Once.h"

UIViewController * vc;
// 自定义视图 图片路径
#define BackImageName(name) [UIImage imageNamed :name]
#define HG_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define CONTROL_W(stance) ((HG_WIDTH/375) * (float)stance)
#define iOS11 ([[UIDevice currentDevice].systemVersion doubleValue] >= 11.0)
//公共标题颜色
#define DSTiTleCommonColor [UIColor colorWithRed:255/255.0  green:255/255.0 blue:255/255.0 alpha:1.0]

@implementation OnceNavTools

//带左右按钮的
+ (void)NavBackButtonLeftOrRight:(UIViewController *)vw leftImg:(NSString *)imgL rigthImg:(NSString *)imgR{
    vc=vw;
    //1.左边按钮
    CGFloat padding4Item = CONTROL_W(15);
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    if (iOS11) {
        UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 44,44)];
        leftBtn.contentEdgeInsets =UIEdgeInsetsMake(0, -20,0, 0);
        leftBtn.imageEdgeInsets =UIEdgeInsetsMake(0, -15,0, 0);
        [leftBtn setImage:BackImageName(imgL) forState:UIControlStateNormal];
        [leftBtn addTarget:vw action:@selector(back)forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
        vw.navigationItem.leftBarButtonItems =@[leftItem];
//    }else{
//        UIBarButtonItem *leftItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:BackImageName(imgL) highImage:BackImageName(imgL)];
//        negativeSpacer.width = padding4Item;
//        vw.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, leftItem, nil];
//    }
    //开启ios右滑返回
    if ([vw.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        vw.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    //2.右边按钮
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithTarget:vw action:@selector(share) image:BackImageName(imgR) highImage:BackImageName(imgR)];
    negativeSpacer.width =  -padding4Item+5;
    vw.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,rightItem , nil];
}

//就左边按钮
+(void)NavBackButtonLeft:(UIViewController *)vw leftImg:(NSString *)imgL{
    //返回按钮
    vw.navigationItem.leftBarButtonItem= [[UIBarButtonItem alloc] initWithImage:BackImageName(imgL) style:UIBarButtonItemStylePlain target:vw action:@selector(back)];
    [vw.navigationController.navigationBar setTintColor:DSTiTleCommonColor];
    //开启ios右滑返回
    if ([vw.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        vw.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    // 设置文字属性 放在设置的文字之后才能起作用
    vw.navigationItem.leftBarButtonItem.tintColor = DSTiTleCommonColor;
    
}

//右边
//+(void)NavBackButtonRight:(UIViewController *)vw RightImg:(NSString *)imgL{
//    vw.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"··· " style:UIBarButtonItemStyleDone target:self action:nil];
//
//
//
//
//    vc=vw;
//    //1.左边按钮
//    CGFloat padding4Item = CONTROL_W(15);
//    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
////    //    if (iOS11) {
////    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 44,44)];
////    leftBtn.contentEdgeInsets =UIEdgeInsetsMake(0, -20,0, 0);
////    leftBtn.imageEdgeInsets =UIEdgeInsetsMake(0, -15,0, 0);
////    [leftBtn setImage:BackImageName(imgL) forState:UIControlStateNormal];
////    [leftBtn addTarget:vw action:@selector(back)forControlEvents:UIControlEventTouchUpInside];
////    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
////    vw.navigationItem.leftBarButtonItems =@[leftItem];
//    //    }else{
//    //        UIBarButtonItem *leftItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:BackImageName(imgL) highImage:BackImageName(imgL)];
//    //        negativeSpacer.width = padding4Item;
//    //        vw.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, leftItem, nil];
//    //    }
//    //开启ios右滑返回
////    if ([vw.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
////        vw.navigationController.interactivePopGestureRecognizer.delegate = nil;
////    }
//    //2.右边按钮
//    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithTarget:vw action:@selector(share) image:BackImageName(imgL) highImage:BackImageName(imgL)];
//    negativeSpacer.width =  -padding4Item+5;
//    vw.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,rightItem , nil];
//}


//返回
-(void)back{
    [vc.navigationController popViewControllerAnimated:YES];
}

@end
