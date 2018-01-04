//
//  OnceRefresh.m
//  OnceKitDemo
//
//  Created by 曹绍奇 on 2017/10/11.
//  Copyright © 2017年 曹绍奇. All rights reserved.
//

#import "OnceRefresh.h"
#import "MJRefresh.h"

#define Image(fileName) [UIImage imageNamed:fileName]


@interface OnceRefresh () {
    NSArray *idleImages;
    NSArray *pullingImages;
    NSArray *refreshingImages;
}

//下拉时候触发的block
@property (nonatomic, copy) void(^DropDownRefreshBlock)(void);

//上拉时候触发的block
@property (nonatomic, copy) void(^UpDropRefreshBlock)(void);

@property (nonatomic, strong) UITableView *parameterTableView;
@property (nonatomic, strong) UIScrollView *scrollview;
@property (nonatomic, strong) UICollectionView *collctionview;

@end


@implementation OnceRefresh

- (instancetype)init {
    if (self = [super init]) {
        
        //此gif为逐帧动画由多张图片组成
        
        //闲置状态下的gif(就是拖动的时候变化的gif)
        idleImages = [[NSArray alloc] initWithObjects:Image(@"zz"), Image(@"zz1"), Image(@"zz2"), Image(@"zz3"), Image(@"zz4"), Image(@"zz5"), nil];
        
        //已经到达偏移量的gif(就是已经到达偏移量的时候的gif)
        pullingImages = [[NSArray alloc] initWithObjects:Image(@"zz"), Image(@"zz1"), Image(@"zz2"), Image(@"zz3"), Image(@"zz4"), Image(@"zz5"), nil];
        
        //正在刷新的时候的gif
        refreshingImages = [[NSArray alloc] initWithObjects:Image(@"zz"), Image(@"zz1"), Image(@"zz2"), Image(@"zz3"), Image(@"zz4"), Image(@"zz5"), nil];
        
    }
    return self;
}

//正常模式下拉上拉刷新(firstRefresh第一次进入的时候是否要刷新,这个值只对下拉刷新有影响)(refreshType设置为只支持上拉或者下拉的时候,将另外一个block置为nil)
- (void)normalModelRefresh:(UITableView *)tableView refreshType:(RefreshType)refreshType firstRefresh:(BOOL)firstRefresh timeLabHidden:(BOOL)timeLabHidden stateLabHidden:(BOOL)stateLabHidden dropDownBlock:(void(^)(void))dropDownBlock upDropBlock:(void(^)(void))upDropBlock {
    
    _parameterTableView = tableView;
    
    if (refreshType == RefreshTypeDropDown) {
        //只支持下拉
        
        //将block传入
        self.DropDownRefreshBlock = dropDownBlock;
        //初始化
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownBlockAction)];
        //是否隐藏上次更新的时间
        header.lastUpdatedTimeLabel.hidden = timeLabHidden;
        //是否隐藏刷新状态label
        header.stateLabel.hidden = stateLabHidden;
        //tableView.mj_header接收header
        tableView.mj_header = header;
        //首次进来是否需要刷新
        if (firstRefresh) {
            [tableView.mj_header beginRefreshing];
        }
        //透明度渐变
        tableView.mj_header.automaticallyChangeAlpha = YES;
    }else if (refreshType == RefreshTypeUpDrop) {
        //只支持上拉
        //传入block
        self.UpDropRefreshBlock = upDropBlock;
        //初始化并指定方法
        tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upDropBlockAction)];
        //指定数据加载完毕的文字
        [(MJRefreshAutoNormalFooter *)tableView.mj_footer setTitle:@"呀,都到底了!" forState:MJRefreshStateNoMoreData];
    }else if (refreshType == RefreshTypeDouble) {
        //上拉和下拉都持支持
        
        //下拉
        //将block传入
        self.DropDownRefreshBlock = dropDownBlock;
        //初始化
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownBlockAction)];
        //是否隐藏上次更新的时间
        header.lastUpdatedTimeLabel.hidden = timeLabHidden;
        //是否隐藏刷新状态label
        header.stateLabel.hidden = stateLabHidden;
        //tableView.mj_header接收header
        tableView.mj_header = header;
        //首次进来是否需要刷新
        if (firstRefresh) {
            [tableView.mj_header beginRefreshing];
        }
        //透明度渐变
        tableView.mj_header.automaticallyChangeAlpha = YES;
        
        //忽略掉底部inset
        tableView.mj_footer.ignoredScrollViewContentInsetBottom = 30;
        
        //上拉
        //将block传入
        self.UpDropRefreshBlock = upDropBlock;
        //初始化并指定方法
        tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upDropBlockAction)];
        //指定数据加载完毕的文字
        [(MJRefreshAutoNormalFooter *)tableView.mj_footer setTitle:@"呀,都到底了!" forState:MJRefreshStateNoMoreData];
    }
}


//gifRefresh
- (void)gifModelRefresh:(UITableView *)tableView refreshType:(RefreshType)refreshType firstRefresh:(BOOL)firstRefresh timeLabHidden:(BOOL)timeLabHidden stateLabHidden:(BOOL)stateLabHidden dropDownBlock:(void(^)(void))dropDownBlock upDropBlock:(void(^)(void))upDropBlock {
    
    _parameterTableView = tableView;
    
    if (refreshType == RefreshTypeDropDown) {
        //只支持下拉
        self.DropDownRefreshBlock = dropDownBlock;
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownBlockAction)];
        [header setImages:idleImages forState:MJRefreshStateIdle];
        [header setImages:pullingImages forState:MJRefreshStatePulling];
        [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
        header.lastUpdatedTimeLabel.hidden = YES;
        header.lastUpdatedTimeLabel.hidden = timeLabHidden;
        header.stateLabel.hidden = stateLabHidden;
        tableView.mj_header = header;
        if (firstRefresh) {
            [tableView.mj_header beginRefreshing];
        }
    }else if (refreshType == RefreshTypeUpDrop) {
        //只支持上拉
        self.UpDropRefreshBlock = upDropBlock;
        //初始化并指定方法
        tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upDropBlockAction)];
        //指定数据加载完毕的文字
        [(MJRefreshAutoNormalFooter *)tableView.mj_footer setTitle:@"呀,都到底了!" forState:MJRefreshStateNoMoreData];
    }else if (refreshType == RefreshTypeDouble) {
        //支持上拉和下拉加载
        self.DropDownRefreshBlock = dropDownBlock;
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownBlockAction)];
        [header setImages:idleImages forState:MJRefreshStateIdle];
        [header setImages:pullingImages forState:MJRefreshStatePulling];
        [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
        header.lastUpdatedTimeLabel.hidden = YES;
        header.lastUpdatedTimeLabel.hidden = timeLabHidden;
        header.stateLabel.hidden = stateLabHidden;
        tableView.mj_header = header;
        if (firstRefresh) {
            [tableView.mj_header beginRefreshing];
        }
        self.UpDropRefreshBlock = upDropBlock;
        //初始化并指定方法
        tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upDropBlockAction)];
        //指定数据加载完毕的文字
        [(MJRefreshAutoNormalFooter *)tableView.mj_footer setTitle:@"呀,都到底了!" forState:MJRefreshStateNoMoreData];
    }
}
//UIScrollView下拉
- (void)gifScrollViewModelRefresh:(UIScrollView *)scrollvieww refreshType:(RefreshType)refreshType firstRefresh:(BOOL)firstRefresh timeLabHidden:(BOOL)timeLabHidden stateLabHidden:(BOOL)stateLabHidden dropDownBlock:(void(^)(void))dropDownBlock upDropBlock:(void(^)(void))upDropBlock{
    _scrollview = scrollvieww;
    
    if (refreshType == RefreshTypeDropDown) {
        //只支持下拉
        self.DropDownRefreshBlock = dropDownBlock;
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownBlockAction)];
        [header setImages:idleImages forState:MJRefreshStateIdle];
        [header setImages:pullingImages forState:MJRefreshStatePulling];
        [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
        header.lastUpdatedTimeLabel.hidden = YES;
        header.lastUpdatedTimeLabel.hidden = timeLabHidden;
        header.stateLabel.hidden = stateLabHidden;
        scrollvieww.mj_header = header;
        if (firstRefresh) {
            [scrollvieww.mj_header beginRefreshing];
        }
    }else if (refreshType == RefreshTypeUpDrop) {
        //只支持上拉
        self.UpDropRefreshBlock = upDropBlock;
        //初始化并指定方法
        scrollvieww.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upDropBlockAction)];
        //指定数据加载完毕的文字
        [(MJRefreshAutoNormalFooter *)scrollvieww.mj_footer setTitle:@"呀,都到底了!" forState:MJRefreshStateNoMoreData];
    }else if (refreshType == RefreshTypeDouble) {
        //支持上拉和下拉加载
        self.DropDownRefreshBlock = dropDownBlock;
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownBlockAction)];
        [header setImages:idleImages forState:MJRefreshStateIdle];
        [header setImages:pullingImages forState:MJRefreshStatePulling];
        [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
        header.lastUpdatedTimeLabel.hidden = YES;
        header.lastUpdatedTimeLabel.hidden = timeLabHidden;
        header.stateLabel.hidden = stateLabHidden;
        scrollvieww.mj_header = header;
        if (firstRefresh) {
            [scrollvieww.mj_header beginRefreshing];
        }
        self.UpDropRefreshBlock = upDropBlock;
        //初始化并指定方法
        scrollvieww.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upDropBlockAction)];
        //指定数据加载完毕的文字
        [(MJRefreshAutoNormalFooter *)scrollvieww.mj_footer setTitle:@"呀,都到底了!" forState:MJRefreshStateNoMoreData];
    }
    
}


//collecview下拉
- (void)gifCollectionViewModelRefresh:(UICollectionView *)collecview refreshType:(RefreshType)refreshType firstRefresh:(BOOL)firstRefresh timeLabHidden:(BOOL)timeLabHidden stateLabHidden:(BOOL)stateLabHidden dropDownBlock:(void(^)(void))dropDownBlock upDropBlock:(void(^)(void))upDropBlock{
    _collctionview = collecview;
    
    if (refreshType == RefreshTypeDropDown) {
        //只支持下拉
        self.DropDownRefreshBlock = dropDownBlock;
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownBlockAction)];
        [header setImages:idleImages forState:MJRefreshStateIdle];
        [header setImages:pullingImages forState:MJRefreshStatePulling];
        [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
        header.lastUpdatedTimeLabel.hidden = YES;
        header.lastUpdatedTimeLabel.hidden = timeLabHidden;
        header.stateLabel.hidden = stateLabHidden;
        collecview.mj_header = header;
        if (firstRefresh) {
            [collecview.mj_header beginRefreshing];
        }
    }else if (refreshType == RefreshTypeUpDrop) {
        //只支持上拉
        self.UpDropRefreshBlock = upDropBlock;
        //初始化并指定方法
        collecview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upDropBlockAction)];
        //指定数据加载完毕的文字
        [(MJRefreshAutoNormalFooter *)collecview.mj_footer setTitle:@"呀,都到底了!" forState:MJRefreshStateNoMoreData];
    }else if (refreshType == RefreshTypeDouble) {
        //支持上拉和下拉加载
        self.DropDownRefreshBlock = dropDownBlock;
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownBlockAction)];
        [header setImages:idleImages forState:MJRefreshStateIdle];
        [header setImages:pullingImages forState:MJRefreshStatePulling];
        [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
        header.lastUpdatedTimeLabel.hidden = YES;
        header.lastUpdatedTimeLabel.hidden = timeLabHidden;
        header.stateLabel.hidden = stateLabHidden;
        collecview.mj_header = header;
        if (firstRefresh) {
            [collecview.mj_header beginRefreshing];
        }
        self.UpDropRefreshBlock = upDropBlock;
        //初始化并指定方法
        collecview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upDropBlockAction)];
        //指定数据加载完毕的文字
        [(MJRefreshAutoNormalFooter *)collecview.mj_footer setTitle:@"呀,都到底了!" forState:MJRefreshStateNoMoreData];
    }
    
}


//下拉时候触发的block
- (void)dropDownBlockAction {
    if (_DropDownRefreshBlock) {
        _DropDownRefreshBlock();
        [_parameterTableView.mj_footer resetNoMoreData];
        [_scrollview.mj_footer resetNoMoreData];
        [_collctionview.mj_footer resetNoMoreData];
    }
}

//上拉时候触发的block
- (void)upDropBlockAction {
    if (_UpDropRefreshBlock) {
        _UpDropRefreshBlock();
    }
}

@end
