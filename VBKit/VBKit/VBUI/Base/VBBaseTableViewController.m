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
            _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATION_BAR_HEIGHT)];
            _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            _tableView.backgroundColor = [VBColorManager colorWithViewBackground];
            _tableView.delegate = self;
            _tableView.dataSource = self;
            [self.view addSubview:_tableView];
            
            [_tableView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:NULL]; // contentSize改变调整HeaderView和
            [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
            
//            [self addRefreshHeaderView];
//            [self addRefreshFooterView];
            
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
