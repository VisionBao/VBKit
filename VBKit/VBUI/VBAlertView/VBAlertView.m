//
//  VBAlertView.m
//  VBKit
//
//  Created by Vision on 15/12/24.
//  Copyright © 2015年 VisionBao. All rights reserved.
//


#import <objc/runtime.h>
#import "VBAlertView.h"

#define VBChoiceAlertViewKey @"VBChoiceAlertViewKey"
#define VBTextAlertViewKey   @"VBTextAlertViewKey"
#define VBProgressHUDKey     @"VBProgressHUDKey"

@implementation VBAlertView{
    UIActivityIndicatorView *_activityView; // 新添加系统自带活动指示器
}

+ (instancetype)shareAlertView
{
    static id managerInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        managerInstance = [[[self class] alloc] init];
    });
    return managerInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
#pragma mark - 弹窗
//普通提示弹窗
- (void)showTipAlert:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

- (void)showTipAlert:(NSString *)message completion:(choiceCompletionBlock)completion
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    objc_setAssociatedObject(alert, VBChoiceAlertViewKey, completion, OBJC_ASSOCIATION_COPY);
    [alert show];
}

//可以选择的弹窗
- (void)showChoiceAlert:(NSString *)message completion:(choiceCompletionBlock)completion
{
    [self showChoiceAlert:message doneTitle:@"确定" completion:completion];
}
- (void)showChoiceAlert:(NSString *)message doneTitle:(NSString *)doneTitile completion:(choiceCompletionBlock)completion
{
    [self showChoiceAlert:message title:@"提示" doneTitle:doneTitile completion:completion];
}
- (void)showChoiceAlert:(NSString *)message title:(NSString *)title doneTitle:(NSString *)doneTitle completion:(choiceCompletionBlock)completion {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:doneTitle, nil];
    objc_setAssociatedObject(alert, VBChoiceAlertViewKey, completion, OBJC_ASSOCIATION_COPY);
    [alert show];
}

// 可自定义Title
- (void)showChoiceAlert:(NSString *)message button1Title:(NSString *)title1 button2Title:(NSString *)title2 completion:(choiceCompletionBlock)completion
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:nil otherButtonTitles:title1, title2, nil];
    objc_setAssociatedObject(alert, VBChoiceAlertViewKey, completion, OBJC_ASSOCIATION_COPY);
    [alert show];
}

- (void)showChoiceAlert:(NSString *)message title:(NSString *)title button1Title:(NSString *)button1Title button2Title:(NSString *)button2Title completion:(choiceCompletionBlock)completion {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:button1Title, button2Title, nil];
    objc_setAssociatedObject(alert, VBChoiceAlertViewKey, completion, OBJC_ASSOCIATION_COPY);
    [alert show];
}

//三选择弹窗
- (void)showChoiceAlert:(NSString *)message button1Title:(NSString *)title1 button2Title:(NSString *)title2 button3Title:(NSString *)title3 completion:(choiceCompletionBlock)completion
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:nil otherButtonTitles:title1, title2, title3, nil];
    objc_setAssociatedObject(alert, VBChoiceAlertViewKey, completion, OBJC_ASSOCIATION_COPY);
    [alert show];
}

//带输入框的弹窗
- (void)showTextFiledAlert:(NSString *)message defaultText:(NSString *)defaultText completion:(textCompletionBlock)completion
{
    [self showTextFiledAlert:message doneTitle:@"确定" defaultText:defaultText completion:completion];
}

- (void)showTextFiledAlert:(NSString *)message doneTitle:(NSString *)doneTitle defaultText:(NSString *)defaultText completion:(textCompletionBlock)completion
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:doneTitle, nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    UITextField *textField = [alert textFieldAtIndex:0];
    [textField setText:defaultText];
    
    objc_setAssociatedObject(alert, VBTextAlertViewKey, completion, OBJC_ASSOCIATION_COPY);
    
    [alert show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    textCompletionBlock textBlock = objc_getAssociatedObject(alertView, VBTextAlertViewKey);
    if (textBlock) {
        if (buttonIndex == 1) {
            UITextField *textField = [alertView textFieldAtIndex:0];
            textBlock(textField.text);
        }
    }
    
    choiceCompletionBlock choiceBlock = objc_getAssociatedObject(alertView, VBChoiceAlertViewKey);
    if (choiceBlock) {
        choiceBlock(buttonIndex);
    }
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
