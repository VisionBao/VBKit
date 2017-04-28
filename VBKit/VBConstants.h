//
//  VBConstants.h
//  VBKit
//
//  Created by Vision on 9/22/16.
//  Copyright © 2016 VisionBao. All rights reserved.
//

#ifndef VBConstants_h
#define VBConstants_h
// 设备的高和宽
#define     kVBSCREEN_WIDTH    ([[UIScreen mainScreen] bounds].size.width)
#define     kVBSCREEN_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)
#define     kVBSCREEN_SCALE   [[UIScreen mainScreen] scale]

#define     kVBSCREEN_MAX_LENGTH (MAX(kVBSCREEN_WIDTH, kVBSCREEN_HEIGHT))
#define     kVBSCREEN_MIN_LENGTH (MIN(kVBSCREEN_WIDTH, kVBSCREEN_HEIGHT))

#define kVBIS_IPAD         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define kVBIS_IPHONE       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kVBIS_RETINA       ([[UIScreen mainScreen] scale] >= 2.0)

#define kVBIS_IPHONE_4_OR_LESS     (kVBIS_IPHONE && kVBSCREEN_MAX_LENGTH < 568.0)
#define kVBIS_IPHONE_5             (kVBIS_IPHONE && kVBSCREEN_MAX_LENGTH == 568.0)
#define kVBIS_IPHONE_5_OR_LESS     (kVBIS_IPHONE && kVBSCREEN_MAX_LENGTH <= 568.0)
#define kVBIS_IPHONE_6_OR_LESS     (kVBIS_IPHONE_6 || kVBIS_IPHONE_6P)
#define kVBIS_IPHONE_6             (kVBIS_IPHONE && kVBSCREEN_MAX_LENGTH == 667.0)
#define kVBIS_IPHONE_6P            (kVBIS_IPHONE && kVBSCREEN_MAX_LENGTH == 736.0)


#define kVBADJUST_SCREEN_WIDTH_SCALE (1 / (CGFloat)320 * kVBSCREEN_WIDTH) // 适配屏幕宽度的比例系数

// 状态栏的高度
#define     kVBSTATUS_BAR_HEIGHT  20 //([UIApplication sharedApplication].statusBarFrame.size.height)

// tab bar的高度
#define     kVBBASE_TAB_BAR_HEIGHT     48

// 所有的导航栏的高度, 这是把状态栏算在内的
#define     kVBNAVIGATION_BAR_HEIGHT   (44.0f + kVBSTATUS_BAR_HEIGHT)

//除去nav高度
#define     kVBVIEW_WITHOUTNAV_HEIGHT (kVBSCREEN_HEIGHT - kVBNAVIGATION_BAR_HEIGHT)

//除去nav tabbar高度

#define     kVBVIEW_WITHOUTNAVTAB_HEIGHT (kVBVIEW_WITHOUTNAV_HEIGHT - kVBBASE_TAB_BAR_HEIGHT)

// 当前app版本号
#define kVBAPP_VERSION_STRING [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]   // 发布版本

// 系统版本
#define kVBSYSTEM_VERSION_STRING [[UIDevice currentDevice] systemVersion]
#define kVBIOS10_OR_LATER ([kVBSYSTEM_VERSION_STRING floatValue] >= 10.0)
#define kVBIOS9_OR_LATER ([kVBSYSTEM_VERSION_STRING floatValue] >= 9.0)
#define kVBIOS8_OR_LATER ([kVBSYSTEM_VERSION_STRING floatValue] >= 8.0)
#define kVBIOS7_OR_LATER ([kVBSYSTEM_VERSION_STRING floatValue] >= 7.0)

// 安全释放C++对象
#define kVBSAFE_DELETE(p) { delete (p); (p) = NULL; }

#define kVBWS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define kVBSS(strongSelf) __strong __typeof__(weakSelf) strongSelf = weakSelf;

typedef void(^VBEventHandler)();
typedef void(^VBEventOneHandler)(id sender);
typedef void(^VBEventTwoHandler)(id sender, id sender1);
typedef void(^VBEventThreeHandler)(id sender, id sender1, id sender2);

#define kVBBlockCall(block)  if(block){block();}
#define kVBBlockCallWithOneArg(block,arg)  if(block){block(arg);}
#define kVBBlockCallWithTwoArg(block,arg1,arg2) if(block){block(arg1,arg2);}
#define kVBBlockCallWithThreeArg(block,arg1,arg2,arg3) if(block){block(arg1,arg2,arg3);}


/** 快速查询一段代码的执行时间 */
/** 用法
 TICK
 do your work here
 TOCK
 */

#define TICK NSDate *startTime = [NSDate date];
#define TOCK NSLog(@"Time:%f", -[startTime timeIntervalSinceNow]);



#endif /* VBConstants_h */
