//
//  ViewController.m
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/12.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import "ViewController.h"
#import <OnceKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView * vv=[UIView viewWithFrame:CGRectMake(0, 0, 100, 100) backGroundColor:[UIColor redColor]];
//                  alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    [self.view addSubview:vv];
    
    
//    UILabel * labele=[UILabel labelWithFrame:CGRectMake(0, 200, 200, CONTROL_W(30)) text:@"顶精神可嘉上课时就开始接口数据库设计苦上加苦色即是空精神可嘉上课时间上赛季上上上计划书见识见识见识见识赛季还是见识见识顶顶顶" textFont:16 textColor:RGB16(0x333333) TextAlignment:NSTextAlignmentLeft withLineSpace:10 WordSpace:10];
    UILabel * labeleee=[UILabel labelWithFrame:CGRectMake(0, 400, 200, 30) text:@"的接口肯定就肯定就看得见的空间的空间的空间的肯定接口的接口的焦点科技的肯定接口的的空间的空间的肯定接口的接口的焦点科技代扣代缴" textFont:16 textColor:RGB16(0x33333) TextAlignment:NSTextAlignmentLeft numberOfLines:NO];
    
    UILabel * label2=[UILabel labelWithFrame:CGRectMake(0, 400, 200, 20) text:@"3333大大大大大多多多对对对" textFont:16 textColor:RGB16(0x333333) TextAlignment:NSTextAlignmentLeft WithTitle:YES];
    label2.backgroundColor=DSRandomColor;
    [self.view addSubview:label2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
