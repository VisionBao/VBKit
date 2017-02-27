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
#import <MJRefresh.h>
#import <Masonry.h>

@interface VBTableViewController ()

@property (nonatomic, assign) BOOL isRefreshing;
@property (nonatomic, strong) MJRefreshHeader *refreshHeaderView;
@property (nonatomic, strong) MJRefreshFooter *refreshFooterView;

@end

@implementation VBTableViewController
- (instancetype)init{
    
    if (self = [super init]) {
        self.isRefreshing = NO;
        _vb_enableFooterRefresh = NO;
        _vb_enableHeaderRefresh = NO;
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
            _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
            _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            _tableView.backgroundColor = [UIColor whiteColor];
            _tableView.delegate = self;
            _tableView.dataSource = self;
            [self.view addSubview:_tableView];
            [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
            _tableView.tableFooterView = [[UIView alloc] init];
           
            [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@0);
                make.left.mas_equalTo(@0);
                make.right.mas_equalTo(@0);
                make.bottom.mas_equalTo(@0);
            }];
        }
        return _tableView;
    }
}

- (void)vb_initNavBar {
    [super vb_initNavBar];
    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@64);
    }];
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

#pragma mark - lazy load
- (void)setVb_enableHeaderRefresh:(BOOL)vb_enableHeaderRefresh {
    _vb_enableHeaderRefresh = vb_enableHeaderRefresh;
    _tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        [self vb_beginToPullUpRefresh];
    }];
}

- (void)setVb_enableFooterRefresh:(BOOL)vb_enableFooterRefresh {
    _vb_enableFooterRefresh = vb_enableFooterRefresh;
    _tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        [self vb_endPullUpRefresh];
    }];
}

/**
 *  停止下拉刷新
 */
- (void)vb_endPullDownRefresh {
    [self.tableView.mj_header endRefreshing];
}
/**
 *  停止上拉加载
 */
- (void)vb_endPullUpRefresh {
    [self.tableView.mj_footer endRefreshing];
    
}

// 没有更多了
- (void)vb_showNoMoreView {
    
}

#pragma mark - 提供给子类重写的方法，子类重写方法后应在方法体最后一句，调用父类方法，表示停止刷新
/**
 *  下拉刷新操作
 */
- (void)vb_beginToPullDownRefresh {

}


/**
 *  上拉加载操作
 */
- (void)vb_beginToPullUpRefresh {
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
