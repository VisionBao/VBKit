//
//  NSDate+VBDate.m
//  VBKitExample
//
//  Created by Vision on 2017/5/1.
//  Copyright © 2017年 VisionBao. All rights reserved.
//

#import "NSDate+VBDate.h"

@implementation NSDate (VBDate)

//时间戳
+ (NSString *)vb_timestamp {
    
    return [[NSNumber numberWithLongLong:[[self date] timeIntervalSince1970] * 1000] stringValue];
}
@end
