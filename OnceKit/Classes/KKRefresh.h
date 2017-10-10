//
//  KKRefresh.h
//  西北招商网云管理系统
//
//  Created by 曹绍奇 on 2017/7/12.
//  Copyright © 2017年 曹绍奇. All rights reserved.

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
/*定义下拉刷新的block*/
typedef void(^HeaderRefreshingBlock)();
/*定义上拉加载更多的block*/
typedef void(^FooterRefreshingBlock)();


@interface KKRefresh : UIViewController
/*下拉刷新的bock*/
@property (nonatomic,strong)HeaderRefreshingBlock headerRefreshingBlock;
/*上拉加载的bock*/
@property (nonatomic,strong)FooterRefreshingBlock FooterRefreshingBlock;

+ (KKRefresh *)shareInstance;

/**
 *  设置头部刷新
 *  @param tableView 当前控制器下面的tableView
 *  @param block 刷新回调block
 */
+(void)setHeaderWithTableView:(UITableView *)tableView  Target:(id)target refreshingBlaock:(HeaderRefreshingBlock)block;

/**
 开始头部刷新
 @param tableView 当前刷新的tableView
 */
+(void)beginHeaderRefreshWithTableView:(UITableView *)tableView;

/**
 结束头部刷新
 @param tableView 当前刷新的tableView
 */
+(void)endHeaderRefreshWithTableView:(UITableView *)tableView;

/**
 *  设置上拉加载更多
 *  @param tableView 当前控制器下面的tableView
 *  @param block 刷新回调block
 */
+(void)setFooterWithTableView:(UITableView *)tableView target:(id)target refreshingBlaock:(FooterRefreshingBlock)block;

/**
 开始底部刷新
 @param tableView 当前刷新的tableView
 */
+(void)beginFooterRefreshWithTableView:(UITableView *)tableView;

/**
 结束底部刷新
 @param tableView 当前刷新的tableView
 */
+(void)endFooterRefreshWithTableView:(UITableView *)tableView;

/**
 提示没有更多数据
 @param tableView 当前刷新的tableView
 */
+(void)endFooterRefreshingWithNoMoreData:(UITableView *)tableView;

/**
 重新设置可以刷新状态
 @param tableView 当前刷新的tableView
 */
+(void)resetNoMoreData:(UITableView *)tableView;

@end

