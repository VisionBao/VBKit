//
//  VBTableViewController.m
//  VBKitExample
//
//  Created by Vision on 2016/11/12.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import "VBTableViewController.h"
#import "MJRefresh/MJRefresh.h"
#import "VBConstants.h"

@interface VBTableViewController ()

@property (nonatomic, assign) BOOL isRefreshing;
@property (nonatomic, strong) MJRefreshHeader *refreshHeaderView;
@property (nonatomic, strong) MJRefreshFooter *refreshFooterView;

@end

@implementation VBTableViewController
- (instancetype)init{
    
    if (self = [super init]) {
        self.isRefreshing = NO;
        _enableFooterRefresh = NO;
        _enableHeaderRefresh = NO;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self tableView];
}

- (UITableView *)tableView {
    @synchronized(self) {
        if (!_tableView) {
            _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT)];
            _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            _tableView.backgroundColor = [UIColor whiteColor];
            _tableView.delegate = self;
            _tableView.dataSource = self;
            [self.view addSubview:_tableView];
            [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
            _tableView.tableFooterView = [[UIView alloc] init];
        }
        return _tableView;
    }
}

- (void)setScrollToTop:(BOOL)scrollToTop {
    if (_tableView) {
        _tableView.scrollsToTop = scrollToTop;
    }
}

- (void)updateContentInset {
    //调整位置
    UIEdgeInsets contentInset = self.tableView.contentInset;
    contentInset.bottom = BASE_TAB_BAR_HEIGHT;
    [self.tableView setContentInset:contentInset];
}

#pragma mark - tableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"测试"];
    cell.textLabel.text = @"测试";
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 提供给子类重写的方法，子类重写方法后应在方法体最后一句，调用父类方法，表示停止刷新
/**
 *  下拉刷新操作
 */
- (void)beginToPullDownRefresh {

}

/**
 *  停止下拉刷新
 */
- (void)endPullDownRefresh {

}

/**
 *  上拉加载操作
 */
- (void)beginToPullUpRefresh {

}

/**
 *  停止上拉加载
 */
- (void)endPullUpRefresh {

}

// 没有更多了
- (void)showNoMoreView {

}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
