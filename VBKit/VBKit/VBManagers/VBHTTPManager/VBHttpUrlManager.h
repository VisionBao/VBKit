//
//  VBHttpUrlManager.h
//  VBKit
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBHttpUrlManager : NSObject

+ (id)defaultManager;
//判断是否为测试环境
- (BOOL)isInTestMode;

- (NSString *)getHostUrl;



@end
