//
//  ViewController.m
//  VBKit
//
//  Created by Vision on 9/22/16.
//  Copyright © 2016 VisionBao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSURLSessionTask *dataTask;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"今日吃什么" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self vb_initNavBarWithCustomView:button tintColor:[UIColor blackColor]];
    [self vb_addRightButtonItemWithTitle:@"fuck" backImg:@"icon_cell_blue_normal@2x"];
    [self vb_addBackButtonItemWithTitle:@"fuck" backImg:@"icon_cell_blue_normal@2x"];
//    [self addBackButtonItem];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *strpath = [paths objectAtIndex:0];
    [[VBConfigDBManager shareManager] insertItem:@"name" value:@"fuck"];
    NSString * dbPath = [strpath stringByAppendingPathComponent:@"VBKit.db.sqlite"];
    [VBDBManager unEncryptDatabase:dbPath encryptKey:@"123456"];
    NSLog(@"%@", [VBFileManager getPathWithType:VBFilePATH_HOME]);
}

- (void)vb_backButtonItemClick {
    int x = arc4random() % 6;
    NSArray *arr = @[@"拉面", @"饺子", @"米线", @"羊杂汤", @"咖啡厅", @"黄焖鸡"];
    NSLog(@"%@", arr[x]);
    [[VBAlertView shareAlertView] showTipAlert:arr[x] title:@"今日吃" completion:nil];
}
- (void)vb_rightButtonItemClick {
    [[VBAlertView shareAlertView] showActionSheet:@"123" completion:^(NSInteger selecteIndex, UIAlertAction *action) {
        NSLog(@"%zd, %@", selecteIndex, action.title);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
