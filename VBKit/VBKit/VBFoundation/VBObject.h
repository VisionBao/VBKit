//
//  VBObject.h
//  VBKit
//
//  Created by Vision on 15/11/20.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBObject : NSObject

@end

@interface NSObject (VBObject)

/**
 *
 *  performSelector 附带多参数
 *
 *  @param aSelector Selector
 *  @param object    参数
 *
 *  @return         执行结果
 */
- (id)performSelector:(SEL)aSelector withMultiObjects:(id)object, ...;

/**
 *
 *  performSelector 附带多参数
 *
 *  @param aSelector Selector
 *  @param delay     延迟执行时间
 *  @param object    参数
 */
- (void)performSelector:(SEL)aSelector afterDelay:(NSTimeInterval)delay withMultiObjects:(id)object, ...;

@end
