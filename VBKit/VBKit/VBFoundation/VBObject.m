//
//  VBObject.m
//  VBKit
//
//  Created by Vision on 15/11/20.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import "VBObject.h"
/**
 *  NSObject 框架基类,添加扩展或者公用方法
 */
@implementation VBObject

@end

@implementation NSObject (VBObject)
- (void)performSelector:(SEL)aSelector afterDelay:(NSTimeInterval)delay withMultiObjects:(id)object, ...
{
    @autoreleasepool
    {
        NSMethodSignature* signature = [self methodSignatureForSelector:aSelector];
        if (signature)
        {
            NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
            [invocation setTarget:self];
            [invocation setSelector:aSelector];
            
            NSUInteger len = signature.numberOfArguments;
            if (len > 2)
            {
                id value = object;
                
                va_list arguments;
                va_start(arguments, object);
                for (int i = 2; i < len; i++)
                {
                    [invocation setArgument:&value atIndex:i];
                    if (value != nil)
                    {
                        value = va_arg(arguments, id);
                    }
                }
                va_end(arguments);
            }
            
            [invocation performSelector:@selector(invoke) withObject:nil afterDelay:delay];
        }
    }
}

- (id)performSelector:(SEL)aSelector withMultiObjects:(id)object, ...
{
    id anObject = nil;
    
    @autoreleasepool
    {
        NSMethodSignature* signature = [self methodSignatureForSelector:aSelector];
        
        if (signature)
        {
            
            NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
            
            [invocation setTarget:self];
            [invocation setSelector:aSelector];
            
            NSUInteger len = signature.numberOfArguments;
            
            if (len > 2)
            {
                id value = object;
                va_list arguments;
                va_start(arguments, object);
                for (int i = 2; i < len; i++)
                {
                    [invocation setArgument:&value atIndex:i];
                    if (value != nil)
                    {
                        value = va_arg(arguments, id);
                    }
                }
                
                va_end(arguments);
            }
            
            [invocation invoke];
            if (signature.methodReturnLength == 1)
            {
                [invocation getReturnValue:&anObject];
            }
        }
    }
    return anObject;
}

@end
