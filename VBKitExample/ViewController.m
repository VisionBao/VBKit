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
    [button setTitle:@"fuck" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self vb_initNavBarWithCustomView:button tintColor:[UIColor blackColor]];
    [self vb_addRightButtonItemWithTitle:@"fuck" backImg:@"icon_cell_blue_normal@2x"];
    [self vb_addBackButtonItemWithTitle:@"fuck" backImg:@"icon_cell_blue_normal@2x"];
//    [self addBackButtonItem];
}

- (void)vb_backButtonItemClick {
    
    self.dataTask = [[VBHTTPManager shareManager] postRequest:@"http://appd.zonetime.net/Api/Apollo/getauthcode" params:nil responseCache:^(id responseCache) {
        NSLog(@"%@----cache", responseCache);
    } success:^(id responseObj) {
        NSLog(@"%@", responseObj);
    } failure:^(NSError *error) {
        
    }];
                              
}
- (void)vb_rightButtonItemClick {
    [VBHTTPCacheManager removeAllHttpCache];
   NSLog(@"%zd", [VBHTTPCacheManager getAllHttpCacheSize]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
