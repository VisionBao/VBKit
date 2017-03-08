//
//  VBUMengAnalyticsManager.m
//  VBBaseExample
//
//  Created by Vision on 2017/3/7.
//  Copyright © 2017年 VisionBao. All rights reserved.
//

#import "VBUMengAnalyticsManager.h"
#import <UMMobClick/MobClick.h>

@implementation VBUMengAnalyticsManager

+ (void)configAppkey:(NSString *)appkey {
    
    UMConfigInstance.appKey = appkey;
    UMConfigInstance.channelId = @"App Store";
    [MobClick setAppVersion:XcodeAppVersion];
#ifdef DEBUG
    [MobClick setLogEnabled:YES];
#else
    [MobClick setLogEnabled:NO];
#endif
    
    [MobClick setLogEnabled:YES];
    [MobClick startWithConfigure:UMConfigInstance];
}

+ (void)event:(NSString *)eventId {
    
    [MobClick event:eventId];
}

@end
