//
//  VBLog.h
//  VBKit
//
//  Created by Vision on 15/11/20.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import "VBObject.h"
#import "CocoaLumberjack.h"

#ifdef LOG_LEVEL_DEF
#undef LOG_LEVEL_DEF
#define LOG_LEVEL_DEF VBLog_logLevel
#endif

#ifdef LOG_ASYNC_ENABLED
#undef LOG_ASYNC_ENABLED
#ifdef DEBUG
#define LOG_ASYNC_ENABLED NO
#else
#define LOG_ASYNC_ENABLED YES
#endif
#endif

typedef NS_ENUM(NSUInteger, VBLogLevel)
{
    VBLogLevelOff = DDLogLevelOff,
    VBLogLevelError = DDLogLevelError,
    VBLogLevelWarning = DDLogLevelWarning,
    VBLogLevelInfo = DDLogLevelInfo,
    VBLogLevelDebug = DDLogLevelDebug,
    VBLogLevelVerbose = DDLogLevelVerbose,
    VBLogLevelAll = DDLogLevelAll
};
extern int VBLog_logLevel;

#define VBLogError(frmt, ...)   DDLogError(frmt, ##__VA_ARGS__)
#define VBLogWarn(frmt, ...)    DDLogWarn(frmt, ##__VA_ARGS__)
#define VBLogInfo(frmt, ...)    DDLogInfo(frmt, ##__VA_ARGS__)
#define VBLogDebug(frmt, ...)   DDLogDebug(frmt, ##__VA_ARGS__)
#define VBLogVerbose(frmt, ...) DDLogVerbose(frmt, ##__VA_ARGS__)

@interface VBLog : VBObject
/**
 *  @author Abc
 *
 *  设置日志级别,必须设置,否则不打开日志
 *
 *  @param logLevel 级别,见枚举.
 */
+ (void)setLevel:(VBLogLevel)logLevel;

@end
