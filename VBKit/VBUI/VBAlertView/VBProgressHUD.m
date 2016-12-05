//
//  VBProgressHUD.m
//  VBKitExample
//
//  Created by Vision on 2016/11/12.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import "VBProgressHUD.h"

@implementation VBProgressHUD

+ (VBProgressHUD *)shareHUD {
    
    static dispatch_once_t once;
    static VBProgressHUD *shareView;
    dispatch_once(&once, ^{
        shareView = [[self alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
        
    });
    return shareView;
}

@end
