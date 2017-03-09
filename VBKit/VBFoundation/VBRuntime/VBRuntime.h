//
//  VBRuntime.h
//  VBKitExample
//
//  Created by Vision on 2017/3/6.
//  Copyright © 2017年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBRuntime : NSObject

/**
 获取类名
 
 @param className 相应类
 @return NSString：类名
 */
+ (NSString *)vb_fetchClassName:(Class)className;

/**
 获取成员变量
 
 @param className 成员变量所在的类
 @return 返回成员变量字符串数组
 */
+ (NSArray *)vb_fetchIvarList:(Class)className;

/**
 获取类的属性列表, 包括私有和公有属性，即定义在延展中的属性
 
 @param className Class
 @return 属性列表数组
 */
+ (NSArray *)vb_fetchPropertyList:(Class)className;

/**
 获取对象方法列表：getter, setter, 对象方法等。但不能获取类方法
 
 @param className 方法所在的类
 @return 该类的方法列表
 */
+ (NSArray *)vb_fetchMethodList:(Class)className;

/**
 获取协议列表
 
 @param className 实现协议的类
 @return 返回该类实现的协议列表
 */
+ (NSArray *)vb_fetchProtocolList:(Class)className;


/**
 添加新的方法
 
 @param className 被添加方法的类
 @param methodSel SEL
 @param methodSelImpl 提供IMP的SEL
 */
+ (void)vb_addMethod: (Class)className method:(SEL)methodSel method:(SEL)methodSelImpl;

/**
 方法交换
 
 @param className 交换方法所在的类
 @param method1 方法1
 @param method2 方法2
 */
+ (void)vb_methodSwap:(Class)className firstMethod:(SEL)method1 secondMethod:(SEL)method2;

@end
