//
//  VBAlertView.h
//  VBKit
//
//  Created by Vision on 15/12/24.
//  Copyright © 2015年 VisionBao. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "VBAlertTextDefine.h"
#import "WSProgressHUD/WSProgressHUD.h"

typedef void (^choiceCompletionBlock)(NSInteger selecteIndex, UIAlertAction *action);
typedef void (^textCompletionBlock)(NSString *text, choiceCompletionBlock);

typedef NS_ENUM(NSInteger, VBProgressHUDMaskWithoutType) { //
    VBProgressHUDMaskWithoutDefault, // default mask all
    VBProgressHUDMaskWithoutNavigation, //show mask without navigation
    VBProgressHUDMaskWithoutTabbar, //show mask without tabbar
    VBProgressHUDMaskWithoutNavAndTabbar, //show mask without tabbar and navigation
};

@interface VBAlertView : NSObject

+ (instancetype)shareAlertView;

#pragma mark - alert

/**
 普通提示弹窗 - 消息
 */
- (void)showTipAlert:(NSString *)message;
- (void)showTipAlert:(NSString *)message
          completion:(choiceCompletionBlock)completion;
/**
 带标题提示弹窗 - 消息 标题
 */
- (void)showTipAlert:(NSString *)message
               title:(NSString *)title
          completion:(choiceCompletionBlock)completion;
/**
 自定义单按钮提示弹窗 - 消息 标题 按钮
 */
- (void)showTipAlert:(NSString *)message
               title:(NSString *)title
           cancelTitle:(NSString *)cancelTitle
          completion:(choiceCompletionBlock)completion;
/**
 双按钮提示弹窗 - 消息 标题 按钮
 */
- (void)showChoiceAlert:(NSString *)message
               title:(NSString *)title
           doneTitle:(NSString *)doneTitle
          completion:(choiceCompletionBlock)completion;
/**
 自定义双按钮提示弹窗 - 消息 标题 确认按钮 取消按钮
 */
- (void)showChoiceAlert:(NSString *)message
                  title:(NSString *)title
              doneTitle:(NSString *)doneTitle
            cancelTitle:(NSString *)cancelTitle
             completion:(choiceCompletionBlock)completion;
/**
 三选择弹窗
 */
- (void)showChoiceAlert:(NSString *)message
                  title:(NSString *)title
           button1Title:(NSString *)title1
           button2Title:(NSString *)title2
           button3Title:(NSString *)title3
             completion:(choiceCompletionBlock)completion;
/**
 <#Description#>

 @param message <#message description#>
 @param title <#title description#>
 @param defaultText <#defaultText description#>
 @param completion <#completion description#>
 */
- (void)showTextFiledAlert:(NSString *)message
                     title:(NSString *)title
               defaultText:(NSString *)defaultText
                completion:(textCompletionBlock)completion;
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
