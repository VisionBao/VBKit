//
//  VBAlertView.h
//  VBKit
//
//  Created by Vision on 15/12/24.
//  Copyright © 2015年 VisionBao. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "VBAlertTextDefine.h"

typedef void (^choiceCompletionBlock)(NSInteger index);
typedef void (^textCompletionBlock)(NSString *text);

typedef NS_ENUM(NSInteger, VBProgressHUDMaskWithoutType) { //
    VBProgressHUDMaskWithoutDefault, // default mask all
    VBProgressHUDMaskWithoutNavigation, //show mask without navigation
    VBProgressHUDMaskWithoutTabbar, //show mask without tabbar
    VBProgressHUDMaskWithoutNavAndTabbar, //show mask without tabbar and navigation
};

@interface VBAlertView : NSObject

+ (instancetype)shareAlertView;

#pragma mark - 弹窗
//普通提示弹窗
- (void)showTipAlert:(NSString *)message;
- (void)showTipAlert:(NSString *)message completion:(choiceCompletionBlock)completion;

//可以选择的弹窗
- (void)showChoiceAlert:(NSString *)message completion:(choiceCompletionBlock)completion;
- (void)showChoiceAlert:(NSString *)message doneTitle:(NSString *)doneTitile completion:(choiceCompletionBlock)completion;
- (void)showChoiceAlert:(NSString *)message button1Title:(NSString *)title1 button2Title:(NSString *)title2 completion:(choiceCompletionBlock)completion;

// 可自定义Title
- (void)showChoiceAlert:(NSString *)message title:(NSString *)title doneTitle:(NSString *)doneTitle completion:(choiceCompletionBlock)completion;
- (void)showChoiceAlert:(NSString *)message title:(NSString *)title button1Title:(NSString *)button1Title button2Title:(NSString *)button2Title completion:(choiceCompletionBlock)completion;

//三选择弹窗
- (void)showChoiceAlert:(NSString *)message button1Title:(NSString *)title1 button2Title:(NSString *)title2 button3Title:(NSString *)title3 completion:(choiceCompletionBlock)completion;

//带输入框的弹窗
- (void)showTextFiledAlert:(NSString *)message defaultText:(NSString *)defaultText completion:(textCompletionBlock)completion;
- (void)showTextFiledAlert:(NSString *)message doneTitle:(NSString *)doneTitle defaultText:(NSString *)defaultText completion:(textCompletionBlock)completion;

#pragma mark - 提示窗

//加载中提示
+ (void)showHUD;
+ (void)showHUDWithMask;

+ (void)showLoadingHUD:(NSString *)status;
+ (void)showLoadingHUDWithMask:(NSString *)status maskWithout:(VBProgressHUDMaskWithoutType)type;

+ (void)showLoadingHUD:(NSString *)status inView:(UIView *)view;
+ (void)showLoadingHUDMask:(NSString *)status inView:(UIView *)view;
//闪光提示
+ (void)showShimmering:(NSString *)string;

+ (void)showProgress:(CGFloat)progress;
+ (void)showProgress:(CGFloat)progress status:(NSString *)status;
//成功提示
+ (void)showSuccessHUD:(NSString *)status;
//失败提示
+ (void)showErrorHUD:(NSString *)status;
//普通文本提示
+ (void)showTextHUD:(NSString *)status;
+ (void)showImage:(UIImage *)image status:(NSString *)status;
//消除提示提示
+ (void)dismiss;
+ (void)dismissWithView:(UIView *)view;
//*****自定义*******//


#pragma mark - 活动指示器
/**
 *  在View的中心位置添加
 */
- (void)showActivityIndicatorViewInView:(UIView *)view;
/**
 *  移除活动指示器
 */
- (void)removeActivityIndicatorView;
/**
 *  在view上添加一个活动指示器，可以设置活动指示器的center
 */
- (void)showActivityIndicatorViewInView:(UIView *)view center:(CGPoint)center;

@end
