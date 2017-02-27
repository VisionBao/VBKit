//
//  VBTableViewController.h
//  VBKitExample
//
//  Created by Vision on 2016/11/12.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import "VBViewController.h"

@interface VBTableViewController : VBViewController <
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
@property (nonatomic, assign) BOOL vb_enableHeaderRefresh;

/**
 *  是否开启上拉加载
 */
@property (nonatomic, assign) BOOL vb_enableFooterRefresh;

/**
 *  调整位置空出tabbar的位置
 */
- (void)updateContentInset;

/**
 *  停止下拉刷新
 */
- (void)vb_endPullDownRefresh;
/**
 *  停止上拉加载
 */
- (void)vb_endPullUpRefresh;

/**
    没有更多了
 */
- (void)vb_showNoMoreView;
#pragma mark - 提供给子类重写的方法，子类重写方法后应在方法体最后一句，调用父类方法，表示停止刷新
/**
 *  下拉刷新操作
 */
- (void)vb_beginToPullDownRefresh;

/**
 *  上拉加载操作
 */
- (void)vb_beginToPullUpRefresh;

@end
