//
//  ViewController.m
//  VBKit
//
//  Created by Vision on 9/22/16.
//  Copyright © 2016 VisionBao. All rights reserved.
//

#import "ViewController.h"


@interface VBBaseViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"fuck" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self initNavBarWithCustomView:button];
    [self addRightButtonItemWithTitle:@"fuck" backImg:@"icon_cell_blue_normal@2x"];
    [self addBackButtonItemWithTitle:@"fuck" backImg:@"icon_cell_blue_normal@2x"];
//    [self addBackButtonItem];
}

- (void)backButtonItemClick {

}

- (void)rightButtonItemClick {

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
