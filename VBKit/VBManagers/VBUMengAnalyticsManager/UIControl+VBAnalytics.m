//
//  UIControl+VBAnalytics.m
//  VBBaseExample
//
//  Created by Vision on 2017/3/7.
//  Copyright © 2017年 VisionBao. All rights reserved.
//

#import "UIControl+VBAnalytics.h"
#import "VBAnalyticsHook.h"
#import "VBUMengAnalyticsManager.h"

@implementation UIControl (VBAnalytics)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (![VBAnalyticsHook actionAnalyticsEnabled]) {
            return;
        }
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL swizzledSelector = @selector(swiz_sendAction:to:forEvent:);
        [VBAnalyticsHook swizzlingInClass:[self class]
                         originalSelector:originalSelector
                         swizzledSelector:swizzledSelector];
    });
}


#pragma mark - Method Swizzling

- (void)swiz_sendAction:(SEL)action
                     to:(id)target
               forEvent:(UIEvent *)event {
    
    [self performUserStastisticsAction:action
                                    to:target
                              forEvent:event];
    [self swiz_sendAction:action
                       to:target
                 forEvent:event];
}

- (void)performUserStastisticsAction:(SEL)action
                                  to:(id)target
                            forEvent:(UIEvent *)event {
    
    NSString *eventID = nil;

    if ([[[event allTouches] anyObject] phase] == UITouchPhaseEnded) {
        NSString *actionString = NSStringFromSelector(action);
        NSString *targetName = NSStringFromClass([target class]);
        NSDictionary *configDict = [VBAnalyticsHook dictionaryFromVBUserAnalyticsConfigPlist];
        eventID = configDict[targetName][@"ControlEventIDs"][actionString];
    }
    if (eventID != nil) {
        [VBUMengAnalyticsManager event:eventID];
    }
}


@end
