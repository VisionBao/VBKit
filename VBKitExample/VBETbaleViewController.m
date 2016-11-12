//
//  VBETbaleViewController.m
//  VBKitExample
//
//  Created by Vision on 2016/11/12.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import "VBETbaleViewController.h"

@interface VBETbaleViewController ()

@end

@implementation VBETbaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭白板" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClick)];
    //    self.navigationItem.leftBarButtonItem = rightItem;
    [self vb_initNavBar];
    
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
