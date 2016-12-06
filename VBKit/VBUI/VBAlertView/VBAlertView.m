//
//  VBAlertView.m
//  VBKit
//
//  Created by Vision on 15/12/24.
//  Copyright © 2015年 VisionBao. All rights reserved.
//


#import <objc/runtime.h>
#import "VBAlertView.h"
#import "UIWindow+VBHierarchy.h"

#define VBChoiceAlertViewKey @"VBChoiceAlertViewKey"
#define VBTextAlertViewKey   @"VBTextAlertViewKey"
#define VBProgressHUDKey     @"VBProgressHUDKey"

@implementation VBAlertView{
   
    UIActivityIndicatorView *_activityView; // 新添加系统自带活动指示器
}

+ (instancetype)shareAlertView {
    
    static id managerInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        managerInstance = [[[self class] alloc] init];
    });
    return managerInstance;
}

- (id)init {
   
    self = [super init];
    if (self) {
        
    }
    return self;
}
#pragma mark - 弹窗
//普通提示弹窗
- (void)showTipAlert:(NSString *)message {
    
    [self showChoiceAlert:message
                    title:nil
                doneTitle:nil
              cancelTitle:@"确定"
               completion:nil];
}

- (void)showTipAlert:(NSString *)message
          completion:(choiceCompletionBlock)completion {
    
    [self showChoiceAlert:message
                    title:nil
                doneTitle:nil
              cancelTitle:@"确定"
               completion:completion];
}

//带标题提示弹窗
- (void)showTipAlert:(NSString *)message
               title:(NSString *)title
          completion:(choiceCompletionBlock)completion {
    
    [self showChoiceAlert:message
                    title:title
                doneTitle:nil
              cancelTitle:@"确定"
               completion:completion];
}

//自定义单按钮提示弹窗
- (void)showTipAlert:(NSString *)message
               title:(NSString *)title
         cancelTitle:(NSString *)cancelTitle
          completion:(choiceCompletionBlock)completion {
    
    [self showChoiceAlert:message
                    title:title
                doneTitle:nil
              cancelTitle:cancelTitle
               completion:completion];
}

//两个按钮提示弹窗
- (void)showChoiceAlert:(NSString *)message
               title:(NSString *)title
           doneTitle:(NSString *)doneTitle
          completion:(choiceCompletionBlock)completion {
    
    [self showChoiceAlert:message
                    title:title
                doneTitle:doneTitle
              cancelTitle:@"取消"
               completion:completion];
}

//自定义双按钮提示弹窗
- (void)showChoiceAlert:(NSString *)message
                  title:(NSString *)title
              doneTitle:(NSString *)doneTitle
            cancelTitle:(NSString *)cancelTitle
             completion:(choiceCompletionBlock)completion {
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             if (completion) {
                                                                 completion(0, action);
                                                             }
                                                         }];
    UIAlertAction *doneAction = nil;
    if (doneTitle) {
        doneAction = [UIAlertAction actionWithTitle:doneTitle
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * _Nonnull action) {
                                                if (completion) {
                                                    completion(1, action);
                                                }
                                            }];
        
    }
    [self showCommonAlert:message
                    title:title
                    style:UIAlertControllerStyleAlert
             actionObject:cancelAction, doneAction, nil];
}

//三选择弹窗
- (void)showChoiceAlert:(NSString *)message
                  title:(NSString *)title
           button1Title:(NSString *)title1
           button2Title:(NSString *)title2
           button3Title:(NSString *)title3
             completion:(choiceCompletionBlock)completion {
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:title1
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             
                                                             if (completion) {
                                                                 completion(0, action);
                                                             }
                                                         }];
    UIAlertAction *action2 = nil;
    if (title2) {
        action2 = [UIAlertAction actionWithTitle:title2
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * _Nonnull action) {
                                                
                                                if (completion) {
                                                    completion(1, action);
                                                }
                                            }];
        
    }
    UIAlertAction *action3 = nil;
    if (title3) {
        action3 = [UIAlertAction actionWithTitle:title3
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * _Nonnull action) {
                                                
                                                if (completion) {
                                                    completion(2, action);
                                                }
                                            }];
        
    }
    [self showCommonAlert:message
                    title:title
                    style:UIAlertControllerStyleAlert
             actionObject:action1, action2, action3,nil];
}

//带输入框的弹窗
- (void)showTextFiledAlert:(NSString *)message
                     title:(NSString *)title
               placeholder:(NSString *)placeholder
                 doneTitle:(NSString *)doneTitle
                completion:(textCompletionBlock)completion {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholder;
    }];
    UITextField *textField = alert.textFields[0];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * _Nonnull action) {
                                                        
                                                        if (completion) {
                                                            completion(textField.text, 0);
                                                        }
                                                    }];
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:doneTitle
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * _Nonnull action) {
                                                        if (completion) {
                                                            completion(textField.text, 1);
                                                        }
                                                    }];
    [alert addAction:cancelAction];
    [alert addAction:doneAction];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [[window vb_currentViewController] presentViewController:alert animated:YES completion:nil];
}


- (void)showCommonAlert:(NSString *)message
                  title:(NSString *)title
                  style:(UIAlertControllerStyle)style
           actionObject:(UIAlertAction *)actionObject, ... NS_REQUIRES_NIL_TERMINATION {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:style];
    va_list args;
    va_start(args, actionObject);
    
    for (UIAlertAction *action = actionObject; action != nil; action = va_arg(args, UIAlertAction*)) {
        [alert addAction:action];
    }
    va_end(args);
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [[window vb_currentViewController] presentViewController:alert animated:YES completion:nil];
}
#pragma mark - 提示窗
//
////加载中提示
+ (void)showHUD
{
    [WSProgressHUD show];
}

+ (void)showHUDWithMask
{
    [WSProgressHUD showWithMaskType:WSProgressHUDMaskTypeBlack];
}

+ (void)showLoadingHUD:(NSString *)status
{
    [WSProgressHUD showWithStatus:status];
}

+ (void)showLoadingHUDWithMask:(NSString *)status maskWithout:(VBProgressHUDMaskWithoutType)type
{
    [WSProgressHUD showWithStatus:status maskType:WSProgressHUDMaskTypeBlack maskWithout:(NSInteger)type];
}

+ (void)showLoadingHUD:(NSString *)status inView:(UIView *)view
{
    if (view) {
        WSProgressHUD* hud = [[WSProgressHUD alloc] initWithView:view];
        [view addSubview:hud];
        [hud showWithString:status maskType:WSProgressHUDMaskTypeDefault];
        objc_setAssociatedObject(view, VBProgressHUDKey, hud, OBJC_ASSOCIATION_RETAIN);
    }
}

+ (void)showLoadingHUDMask:(NSString *)status inView:(UIView *)view
{
    if (view) {
        WSProgressHUD* hud = [[WSProgressHUD alloc] initWithView:view];
        [view addSubview:hud];
        [hud showWithString:status maskType:WSProgressHUDMaskTypeBlack];
        objc_setAssociatedObject(view, VBProgressHUDKey, hud, OBJC_ASSOCIATION_RETAIN);
    }
}

+ (void)showShimmering:(NSString *)string
{
    [WSProgressHUD showShimmeringString:string];
}

+ (void)showProgress:(CGFloat)progress
{
    [WSProgressHUD showProgress:progress];
}

+ (void)showProgress:(CGFloat)progress status:(NSString *)status
{
    [WSProgressHUD showProgress:progress status:status];
}
////成功提示
+ (void)showSuccessHUD:(NSString *)status
{
    UIImage *successImage = [UIImage imageNamed:@"VBsuccess.png"];
    [WSProgressHUD showImage:successImage status:status];
}
////失败提示
+ (void)showErrorHUD:(NSString *)status
{
    UIImage *errorImage = [UIImage imageNamed:@"VBerror.png"];
    [WSProgressHUD showImage:errorImage status:status];
}
////普通文本提示
+ (void)showTextHUD:(NSString *)status
{
    [WSProgressHUD showImage:nil status:status];
}
+ (void)showImage:(UIImage *)image status:(NSString *)status{
    [WSProgressHUD showImage:image status:status];
}
//消除提示提示
+ (void)dismiss{
    [WSProgressHUD dismiss];
   
}
+ (void)dismissWithView:(UIView *)view{
   WSProgressHUD* hud = objc_getAssociatedObject(view, VBProgressHUDKey);
    [hud dismiss];
}
//+ (void)dismissWithAnimated:(BOOL)animated;
//// 数据获取失败
//+ (void)showFetchError;


#pragma mark -
#pragma mark 活动指示器相关
- (void)showActivityIndicatorViewInView:(UIView *)view{
    if (_activityView == nil) {
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_activityView setFrame:CGRectMake(0, 0, 50, 50)
         ];
    }
    
    _activityView.center = view.center;
    [view addSubview:_activityView];
    [_activityView startAnimating];
}

- (void)showActivityIndicatorViewInView:(UIView *)view center:(CGPoint)center {
    [self showActivityIndicatorViewInView:view];
    _activityView.center = center;
}

- (void)removeActivityIndicatorView {
    [_activityView stopAnimating];
    _activityView = nil;
}



@end
