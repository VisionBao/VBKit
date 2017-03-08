//
//  VBAnalyticsHook.m
//  VBBaseExample
//
//  Created by Vision on 2017/3/7.
//  Copyright © 2017年 VisionBao. All rights reserved.
//

#import "VBAnalyticsHook.h"
#import <objc/runtime.h>

@implementation VBAnalyticsHook

#pragma mark - action
+ (BOOL)actionAnalyticsEnabled {
    
    if (![self ishaveVBUserAnalyticsConfigFile]) {
        return NO;
    }
    NSDictionary *configDict =
    [self dictionaryFromVBUserAnalyticsConfigPlist];
    BOOL actionEnabled =
    [(NSNumber*)[configDict objectForKey:@"ActionEnabled"]boolValue];
    return actionEnabled;
}

#pragma mark - page
+ (BOOL)pageAnalyticsEnabled {
    
    if (![self ishaveVBUserAnalyticsConfigFile]) {
        return NO;
    }
    return [self pageForEnter] || [self pageForLeave];
}
+ (BOOL)pageForEnter {
    
    if (![self ishaveVBUserAnalyticsConfigFile]) {
        return NO;
    }
    NSDictionary *configDict =
    [self dictionaryFromVBUserAnalyticsConfigPlist];
    BOOL enterEnabled =
    [(NSNumber*)configDict[@"PageEnterEnabled"] boolValue];
    return enterEnabled;
}
+ (BOOL)pageForLeave {
    
    if (![self ishaveVBUserAnalyticsConfigFile]) {
        return NO;
    }
    NSDictionary *configDict =
    [self dictionaryFromVBUserAnalyticsConfigPlist];
    BOOL leaveEnabled =
    [(NSNumber*)configDict[@"PageLeaveEnabled"] boolValue];
    return leaveEnabled;
}

#pragma mark - plist
+ (NSDictionary *)dictionaryFromVBUserAnalyticsConfigPlist {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"VBUserAnalyticsConfig" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}

+ (BOOL)ishaveVBUserAnalyticsConfigFile {
    if ([self dictionaryFromVBUserAnalyticsConfigPlist]
        == nil) {
        return NO;
    }
    return YES;
}

#pragma mark - method
+ (void)swizzlingInClass:(Class)cls
        originalSelector:(SEL)originalSelector
        swizzledSelector:(SEL)swizzledSelector
{
    Class class = cls;
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
