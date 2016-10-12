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
#define     SCREEN_WIDTH    ([[UIScreen mainScreen] bounds].size.width)
#define     SCREEN_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)
#define     SCREEN_SCALE   [[UIScreen mainScreen] scale]

#define     SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define     SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPAD     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA   ([[UIScreen mainScreen] scale] >= 2.0)

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_GREATER_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH >= 568.0)

#define ADJUST_SCREEN_WIDTH_SCALE (1 / (CGFloat)320 * SCREEN_WIDTH) // 适配屏幕宽度的比例系数

// 状态栏的高度
#define     STATUS_BAR_HEIGHT  20 //([UIApplication sharedApplication].statusBarFrame.size.height)

// tab bar的高度
#define     BASE_TAB_BAR_HEIGHT     48

// 所有的导航栏的高度, 这是把状态栏算在内的
#define     NAVIGATION_BAR_HEIGHT   (44.0f + STATUS_BAR_HEIGHT)

//除去nav高度
#define     VIEW_WITHOUTNAV_HEIGHT (SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT)

//除去nav tabbar高度

#define     VIEW_WITHOUTNAVTAB_HEIGHT (VIEW_WITHOUTNAV_HEIGHT - BASE_TAB_BAR_HEIGHT)

// 当前app版本号
#define APP_VERSION_STRING [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]   // 发布版本

// 系统版本
#define SYSTEM_VERSION_STRING [[UIDevice currentDevice] systemVersion]

// 安全释放C++对象
#define SAFE_DELETE(p) { delete (p); (p) = NULL; }

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define SS(strongSelf) __strong __typeof__(weakSelf) strongSelf = weakSelf;

#endif /* VBConstants_h */
