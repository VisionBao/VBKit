//
//  ViewController.m
//  VBKit
//
//  Created by Vision on 9/22/16.
//  Copyright © 2016 VisionBao. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertController+VBAlert.h"

@interface ViewController ()

@property (nonatomic, strong) NSURLSessionTask *dataTask;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self vb_initNavBar];
    [self vb_addBackButtonItem];
    [self vb_addRightButtonItem];
}

- (void)vb_backButtonItemClick {
  
    [UIAlertController vb_showActionSheet:@"123" title:@"222" buttonTitle:@"2222222" cancelButtonTitle:@"22" completion:^(NSInteger selecteIndex, UIAlertAction *action) {
        
    }];
}
- (void)vb_rightButtonItemClick {
    
    [UIAlertController vb_showActionSheet:@"111" title:@"222" buttonTitles:@[@"1",@"2",@"3", @"4", @"5"] cancelButtonTitle:@"quxiao" completion:^(NSInteger selecteIndex, UIAlertAction *action) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
