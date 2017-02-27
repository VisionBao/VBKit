//
//  VBProgressHUD.h
//  VBKitExample
//
//  Created by Vision on 2016/11/12.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VBProgressHUDMaskType) {
    VBProgressHUDMaskTypeDefault, //allow user touch when hud display
    VBProgressHUDMaskTypeClear,   //dont allowed user touch
    VBProgressHUDMaskTypeBlack,   //dont allowed user touch
    VBProgressHUDMaskTypeGradient //dont allowed user touch
};
typedef NS_ENUM(NSInteger, VBProgressHUDMaskWithoutType) { //
    VBProgressHUDMaskWithoutDefault, // default mask all
    VBProgressHUDMaskWithoutNavigation, //show mask without navigation
    VBProgressHUDMaskWithoutTabbar, //show mask without tabbar
    VBProgressHUDMaskWithoutNavAndTabbar, //show mask without tabbar and navigation
};
//typedef NS_ENUM(NSInteger, VBProgressHUDMaskWithoutType) {
//    VBProgressHUDMaskWithoutDefault,        // default mask all
//    VBProgressHUDMaskWithoutNavigation,     //show mask without navigation
//    VBProgressHUDMaskWithoutTabbar,         //show mask without tabbar
//    VBProgressHUDMaskWithoutNavAndTabbar,   //show mask without tabbar and navigation
//};


@interface VBProgressHUD : UIView
#pragma mark - 提示窗
//
////加载中提示
//+ (void)showHUD;
//+ (void)showHUDWithMask;
//
//+ (void)showLoadingHUD:(NSString *)status;
//+ (void)showLoadingHUDWithMask:(NSString *)status maskWithout:(VBProgressHUDMaskWithoutType)type;
//
//+ (void)showLoadingHUD:(NSString *)status inView:(UIView *)view;
//+ (void)showLoadingHUDMask:(NSString *)status inView:(UIView *)view;
////闪光提示
//+ (void)showShimmering:(NSString *)string;
//
//+ (void)showProgress:(CGFloat)progress;
//+ (void)showProgress:(CGFloat)progress status:(NSString *)status;
////成功提示
//+ (void)showSuccessHUD:(NSString *)status;
////失败提示
//+ (void)showErrorHUD:(NSString *)status;
////普通文本提示
//+ (void)showTextHUD:(NSString *)status;
//+ (void)showImage:(UIImage *)image status:(NSString *)status;
////消除提示提示
//+ (void)dismiss;
//+ (void)dismissWithView:(UIView *)view;
////*****自定义*******//

@end
