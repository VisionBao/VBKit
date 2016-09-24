//
//  VBTableViewController.m
//  VBKit
//
//  Created by Vision on 9/23/16.
//  Copyright © 2016 VisionBao. All rights reserved.
//

#import "VBTableViewController.h"

@interface VBTableViewController ()

@end

@implementation VBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭白板" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClick)];
//    self.navigationItem.leftBarButtonItem = rightItem;
    [self initNavBar];

}

- (void)rightBtnClick {

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
