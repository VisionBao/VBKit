//
//  VBRuntime.m
//  VBKitExample
//
//  Created by Vision on 2017/3/6.
//  Copyright © 2017年 VisionBao. All rights reserved.
//

#import "VBRuntime.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation VBRuntime

/**
 获取类名
 
 @param className 相应类
 @return NSString：类名
 */
+ (NSString *)vb_fetchClassName:(Class)className {
    const char *classNameStr = class_getName(className);
    return [NSString stringWithUTF8String:classNameStr];
}

/**
 获取成员变量
 
 @param className Class
 @return NSArray
 */
+ (NSArray *)vb_fetchIvarList:(Class)className {
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(className, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++ ) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:2];
        const char *ivarName = ivar_getName(ivarList[i]);
        const char *ivarType = ivar_getTypeEncoding(ivarList[i]);
        dic[@"type"] = [NSString stringWithUTF8String: ivarType];
        dic[@"ivarName"] = [NSString stringWithUTF8String: ivarName];
        
        [mutableList addObject:dic];
    }
    free(ivarList);
    return [NSArray arrayWithArray:mutableList];
}

/**
 获取类的属性列表, 包括私有和公有属性，以及定义在延展中的属性
 
 @param className Class
 @return 属性列表数组
 */
+ (NSArray *)vb_fetchPropertyList:(Class)className {
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList(className, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++ ) {
        const char *propertyName = property_getName(propertyList[i]);
        [mutableList addObject:[NSString stringWithUTF8String: propertyName]];
    }
    free(propertyList);
    return [NSArray arrayWithArray:mutableList];
}


/**
 获取类的实例方法列表：getter, setter, 对象方法等。但不能获取类方法
 */
+ (NSArray *)vb_fetchMethodList:(Class)className {
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(className, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++ ) {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        [mutableList addObject:NSStringFromSelector(methodName)];
    }
    free(methodList);
    return [NSArray arrayWithArray:mutableList];
}

/**
 获取协议列表
 */
+ (NSArray *)vb_fetchProtocolList:(Class)className {
    unsigned int count = 0;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(className, &count);
    
    NSMutableArray *mutableList = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++ ) {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        [mutableList addObject:[NSString stringWithUTF8String: protocolName]];
    }
    
    return [NSArray arrayWithArray:mutableList];
    return nil;
}


/**
 往类上添加新的方法与其实现
 
 @param className 相应的类
 @param methodSel 方法的名
 @param methodSelImpl 对应方法实现的方法名
 */
+ (void)vb_addMethod:(Class)className method:(SEL)methodSel method:(SEL)methodSelImpl {
    Method method = class_getInstanceMethod(className, methodSelImpl);
    IMP methodIMP = method_getImplementation(method);
    const char *types = method_getTypeEncoding(method);
    class_addMethod(className, methodSel, methodIMP, types);
}

/**
 方法交换
 
 @param className 交换方法所在的类
 @param method1 方法1
 @param method2 方法2
 */
+ (void)vb_methodSwap:(Class)className firstMethod:(SEL)method1 secondMethod:(SEL)method2 {
    Method firstMethod = class_getInstanceMethod(className, method1);
    Method secondMethod = class_getInstanceMethod(className, method2);
    method_exchangeImplementations(firstMethod, secondMethod);
}

@end
