//
//  VBAnalyticsHook.h
//  VBBaseExample
//
//  Created by Vision on 2017/3/7.
//  Copyright © 2017年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBAnalyticsHook : NSObject

#pragma mark - action
+ (BOOL)actionAnalyticsEnabled;

#pragma mark - page
+ (BOOL)pageAnalyticsEnabled;
+ (BOOL)pageForEnter;
+ (BOOL)pageForLeave;

#pragma mark - plist
+ (NSDictionary *)dictionaryFromVBUserAnalyticsConfigPlist;

#pragma mark - method
+ (void)swizzlingInClass:(Class)cls
        originalSelector:(SEL)originalSelector
        swizzledSelector:(SEL)swizzledSelector;


@end
