//
//  VBBaseTableViewController.m
//  VBKit
//
//  Created by Vision on 9/23/16.
//  Copyright © 2016 VisionBao. All rights reserved.
//

#import "VBBaseTableViewController.h"
#import <MJRefresh.h>
#import "VBColorManager.h"

@interface VBBaseTableViewController ()
/**
 *  上下拉刷新
 */
@property (nonatomic, assign) BOOL isRefreshing;
@property (nonatomic, strong) MJRefreshHeader *refreshHeaderView;
@property (nonatomic, strong) MJRefreshFooter *refreshFooterView;

@end

@implementation VBBaseTableViewController

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
            _tableView.backgroundColor = [VBColorManager colorWithViewBackground];
            _tableView.delegate = self;
            _tableView.dataSource = self;
            [self.view addSubview:_tableView];
            [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
            _tableView.tableFooterView = [[UIView alloc] init];
        }
        return _tableView;
    }
}

/**
 *  重写headerView getter
 *
 */
- (void)addRefreshHeaderView {
    if (!self.enableHeaderRefresh) {
        return;
    }
    
//    if (!_refreshHeaderView) {
//        _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(10.0f, - _tableView.height, _tableView.width, _tableView.height)];
//        [_tableView addSubview:_refreshHeaderView];
//        _refreshHeaderView.delegate = self;
//    } else {
//        [_refreshHeaderView setFrame:CGRectMake(10.0f, - _tableView.height, _tableView.width, _tableView.height)];
//    }
}

/**
 *  移除refreshHeaderView
 */
-(void)removeHeaderView {
//    [self.refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:_tableView];
    self.isRefreshing = NO;
    [self.refreshHeaderView removeFromSuperview];
    self.refreshHeaderView = nil;
}


/**
 *  重写footerView getter
 *
 */
- (void)addRefreshFooterView {
    if (!self.enableFooterRefresh) {
        return;
    }
    if (!_refreshHeaderView) {
//        _refreshHeaderView = [mj]
    }
//    CGFloat height=MAX(SCREEN_HEIGHT - BASE_TAB_BAR_HEIGHT, _tableView.contentSize.height);
//    if (!_refreshFooterView) {
//        _refreshFooterView = [[EGORefreshTableFooterView alloc] initWithFrame:CGRectMake(0.f, height, _tableView.width, _tableView.height) arrowImageName:@"blackArrow.png" textColor:[UIColor colorWithHex:0x666666]];
//        [_tableView addSubview:_refreshFooterView];
//        _refreshFooterView.delegate = self;
//    } else {
//        [_refreshFooterView setFrame:CGRectMake(0.f, height, _tableView.width, _tableView.height)];
//    }
}

/**
 *  移除FooterView
 */
-(void)removeFooterView {
//    [self.refreshFooterView egoRefreshScrollViewDataSourceDidFinishedLoading:_tableView];
    self.isRefreshing = NO;
    [self.refreshFooterView removeFromSuperview];
    self.refreshFooterView = nil;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
