//
//  UIViewControl+VBAnalytics.m
//  VBBaseExample
//
//  Created by Vision on 2017/3/7.
//  Copyright © 2017年 VisionBao. All rights reserved.
//

#import "UIViewController+VBAnalytics.h"
#import "VBAnalyticsHook.h"
#import "VBUMengAnalyticsManager.h"

@implementation UIViewController (VBAnalytics)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (![VBAnalyticsHook pageAnalyticsEnabled]) {
            return;
        }
        if ([VBAnalyticsHook pageForEnter]) {
            SEL originalSelector = @selector(viewWillAppear:);
            SEL swizzledSelector = @selector(swiz_viewWillAppear:);
            [VBAnalyticsHook swizzlingInClass:[self class]
                             originalSelector:originalSelector
                             swizzledSelector:swizzledSelector];
        }
        if ([VBAnalyticsHook pageForLeave]) {
            SEL originalSelector2 = @selector(viewWillDisappear:);
            SEL swizzledSelector2 = @selector(swiz_viewWillDisappear:);
            [VBAnalyticsHook swizzlingInClass:[self class]
                             originalSelector:originalSelector2
                             swizzledSelector:swizzledSelector2];
        }
    });
}

#pragma mark - Method Swizzling

- (void)swiz_viewWillAppear:(BOOL)animated {
    [self inject_viewWillAppear];
    [self swiz_viewWillAppear:animated];
}

- (void)swiz_viewWillDisappear:(BOOL)animated {
    [self inject_viewWillDisappear];
    [self swiz_viewWillDisappear:animated];
}

- (void)inject_viewWillAppear {
    NSString *pageID = [self pageEventID:YES];
    if (pageID) {
        [VBUMengAnalyticsManager event:pageID];
    }
}

- (void)inject_viewWillDisappear {
    NSString *pageID = [self pageEventID:NO];
    if (pageID) {
        [VBUMengAnalyticsManager event:pageID];
    }
}

- (NSString *)pageEventID:(BOOL)bEnterPage {
    NSDictionary *configDict = [VBAnalyticsHook dictionaryFromVBUserAnalyticsConfigPlist];
    NSString *selfClassName = NSStringFromClass([self class]);
    return configDict[selfClassName][@"PageEventIDs"][bEnterPage ? @"Enter" : @"Leave"];
}


@end
