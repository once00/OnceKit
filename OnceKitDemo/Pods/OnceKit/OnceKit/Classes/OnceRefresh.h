//
//  OnceRefresh.h
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//
//核心类

//当前类的封装都是基于MJRefresh的(当前类为对MJRefresh的二次封装)
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RefreshType) {
    RefreshTypeDropDown = 0,  //只支持下拉
    RefreshTypeUpDrop = 1,    //只支持上拉
    RefreshTypeDouble = 2,    //支持上拉和下拉
};

@interface OnceRefresh : NSObject

//正常模式上拉下拉刷新
- (void)normalModelRefresh:(UITableView *)tableView refreshType:(RefreshType)refreshType firstRefresh:(BOOL)firstRefresh timeLabHidden:(BOOL)timeLabHidden stateLabHidden:(BOOL)stateLabHidden dropDownBlock:(void(^)(void))dropDownBlock upDropBlock:(void(^)(void))upDropBlock;

//gifRefresh(tableview的刷新)
- (void)gifModelRefresh:(UITableView *)tableView refreshType:(RefreshType)refreshType firstRefresh:(BOOL)firstRefresh timeLabHidden:(BOOL)timeLabHidden stateLabHidden:(BOOL)stateLabHidden dropDownBlock:(void(^)(void))dropDownBlock upDropBlock:(void(^)(void))upDropBlock;

//gifRefresh(scrollview的刷新)
- (void)gifScrollViewModelRefresh:(UIScrollView *)scrollview refreshType:(RefreshType)refreshType firstRefresh:(BOOL)firstRefresh timeLabHidden:(BOOL)timeLabHidden stateLabHidden:(BOOL)stateLabHidden dropDownBlock:(void(^)(void))dropDownBlock upDropBlock:(void(^)(void))upDropBlock;

//后期如果有需要还要对diy的模式进行封装

@end
