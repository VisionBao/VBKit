//
//  VBBaseTableViewController.h
//  VBKit
//
//  Created by Vision on 9/23/16.
//  Copyright © 2016 VisionBao. All rights reserved.
//

#import "VBBaseViewController.h"

@interface VBBaseTableViewController : VBBaseViewController <
UITableViewDelegate,
UITableViewDataSource
>
//- (void)autoHidehideNavigationBar;
/**
 *  默认的tableView
 */
@property (nonatomic, strong) UITableView *tableView;

/**
 *  是否开启下拉刷新
 */
@property (nonatomic, assign) BOOL enableHeaderRefresh;

/**
 *  是否开启上拉加载
 */
@property (nonatomic, assign) BOOL enableFooterRefresh;

///**
// *  设置tableView的ScrollToTop
// */
//- (void)setScrollToTop:(BOOL)scrollToTop;
//
///**
// *  调整位置空出tabbar的位置
// */
//- (void)updateContentInset;
//
//#pragma mark - 提供给子类重写的方法，子类重写方法后应在方法体最后一句，调用父类方法，表示停止刷新
///**
// *  下拉刷新操作
// */
//- (void)beginToPullDownRefresh;
//
///**
// *  停止下拉刷新
// */
//- (void)endPullDownRefresh;
//
///**
// *  上拉加载操作
// */
//- (void)beginToPullUpRefresh;
//
///**
// *  停止上拉加载
// */
//- (void)endPullUpRefresh;
//
//// 没有更多了
//- (void)showNoMoreView;

@end
