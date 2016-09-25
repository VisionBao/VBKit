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
//            [self addRefreshHeaderView];
//            [self addRefreshFooterView];
            
        }
        
        return _tableView;
    }
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
