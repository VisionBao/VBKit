//
//  VBHttpUrlManager.m
//  VBKit
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import "VBHttpUrlManager.h"

#define BaseUrl                  @""
#define BaseUrl_Test             @""
#define SERVICE_HOST_URL         [self getServiceHostURL]



#ifdef DEBUG
static BOOL bInTestMode = YES;//如果需要切换可以进行手动调整
#else
static BOOL bInTestMode = NO;
#endif


@implementation VBHttpUrlManager
+ (id)defaultManager {
    static id s_UrlUtilInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_UrlUtilInstance = [[[self class] alloc] init];
    });
    return s_UrlUtilInstance;
}

- (BOOL)isInTestMode {
    return bInTestMode;
}

- (NSString *)getServiceHostURL {
    if ([self isInTestMode]) {
        return BaseUrl_Test;
    }
    return BaseUrl;
}
- (NSString *)getHostUrl{
    return SERVICE_HOST_URL;
}

@end
