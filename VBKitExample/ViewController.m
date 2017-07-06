//
//  ViewController.m
//  VBKit
//
//  Created by Vision on 9/22/16.
//  Copyright © 2016 VisionBao. All rights reserved.
//

#import "ViewController.h"
#import "VBConfigDBManager.h"
#import "VBDBManager.h"
@interface ViewController ()

@property (nonatomic, strong) NSURLSessionTask *dataTask;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setTitle:@"fuck" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
//    [self vb_initNavBarWithCustomView:button tintColor:[UIColor blackColor]];
//    [self vb_addRightButtonItemWithTitle:@"fuck" backImg:@"icon_cell_blue_normal@2x"];
//    [self vb_addBackButtonItemWithTitle:@"fuck" backImg:@"icon_cell_blue_normal@2x"];
////    [self addBackButtonItem];
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *strpath = [paths objectAtIndex:0];
//    [[VBConfigDBManager shareManager] insertItem:@"name" value:@"fuck"];
//    NSString * dbPath = [strpath stringByAppendingPathComponent:@"VBKit.db.sqlite"];
//    [VBDBManager unEncryptDatabase:dbPath encryptKey:@"123456"];
//    NSLog(@"%@", [VBFileManager getPathWithType:VBFilePATH_HOME]);
    
   NSSet * set =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    [[VBHTTPManager shareManager] setAcceptableContentTypes:set];
    
    [[VBHTTPManager shareManager] getRequest:@"http://www.0476ml.com/index.php/home/Index/Android" params:nil success:^(id responseObj, NSURLSessionDataTask *task) {
        
        
    } failure:^(NSError *error, NSURLSessionDataTask *task) {
        
    }];
}

- (void)vb_backButtonItemClick {
    [VBLocationManager shareManager];
}
- (void)vb_rightButtonItemClick {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
