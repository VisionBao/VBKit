//
//  UIAlertController+VBAlert.m
//  VBKitExample
//
//  Created by Vision on 2017/3/9.
//  Copyright © 2017年 VisionBao. All rights reserved.
//

#import "UIAlertController+VBAlert.h"

static UIAlertController *_alertCtrl;

@implementation UIAlertController (VBAlert)

#pragma mark - alert
//普通提示弹窗
+ (void)vb_showTipAlert:(NSString *)message {
    
    [self vb_showChoiceAlert:message
                    title:@""
                doneTitle:nil
              cancelTitle:@"确定"
               completion:nil];
}

+ (void)vb_showTipAlert:(NSString *)message
          completion:(choiceCompletionBlock)completion {
    
    [self vb_showChoiceAlert:message
                    title:@""
                doneTitle:nil
              cancelTitle:@"确定"
               completion:completion];
}

//带标题提示弹窗
+ (void)vb_showTipAlert:(NSString *)message
               title:(NSString *)title
          completion:(choiceCompletionBlock)completion {
    
    [self vb_showChoiceAlert:message
                    title:title
                doneTitle:nil
              cancelTitle:@"确定"
               completion:completion];
}

//自定义单按钮提示弹窗
+ (void)vb_showTipAlert:(NSString *)message
               title:(NSString *)title
         cancelTitle:(NSString *)cancelTitle
          completion:(choiceCompletionBlock)completion {
    
    [self vb_showChoiceAlert:message
                    title:title
                doneTitle:nil
              cancelTitle:cancelTitle
               completion:completion];
}

//两个按钮提示弹窗
+ (void)vb_showChoiceAlert:(NSString *)message
                  title:(NSString *)title
              doneTitle:(NSString *)doneTitle
             completion:(choiceCompletionBlock)completion {
    
    [self vb_showChoiceAlert:message
                    title:title
                doneTitle:doneTitle
              cancelTitle:@"取消"
               completion:completion];
}

//自定义双按钮提示弹窗
+ (void)vb_showChoiceAlert:(NSString *)message
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
    [self vb_showCommonAlert:message
                    title:title
                    style:UIAlertControllerStyleAlert
             actionObject:cancelAction, doneAction, nil];
}

//三选择弹窗
+ (void)vb_showChoiceAlert:(NSString *)message
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
    [self vb_showCommonAlert:message
                    title:title
                    style:UIAlertControllerStyleAlert
             actionObject:action1, action2, action3,nil];
}

//带输入框的弹窗
+ (void)vb_showTextFiledAlert:(NSString *)message
                     title:(NSString *)title
               placeholder:(NSString *)placeholder
                 doneTitle:(NSString *)doneTitle
                completion:(textCompletionBlock)completion {
    
    _alertCtrl = nil;
    _alertCtrl = [UIAlertController alertControllerWithTitle:title
                                                     message:message
                                              preferredStyle:UIAlertControllerStyleAlert];
    
    [_alertCtrl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholder;
    }];
    UITextField *textField = _alertCtrl.textFields[0];
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
    [_alertCtrl addAction:cancelAction];
    [_alertCtrl addAction:doneAction];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [[window vb_currentViewController] presentViewController:_alertCtrl animated:YES completion:nil];
}
#pragma mark - actionSheet

/**
 单选弹层
 */
+ (void)vb_showActionSheet:(NSString *)buttonTitle
             completion:(choiceCompletionBlock)completion {
    
    [self vb_showActionSheet:nil
                    title:nil
             buttonTitles:@[buttonTitle]
        cancelButtonTitle:@"取消"
               completion:completion];
}
/**
 单选弹层 - 消息 标题 按钮
 */
+ (void)vb_showActionSheet:(NSString *)message
                  title:(NSString *)title
            buttonTitle:(NSString *)buttonTitle
             completion:(choiceCompletionBlock)completion {
    
    [self vb_showActionSheet:message
                    title:title
             buttonTitles:@[buttonTitle]
        cancelButtonTitle:@"取消"
               completion:completion];
}
/**
 单选弹层 - 消息 标题 按钮 取消按钮
 */
+ (void)vb_showActionSheet:(NSString *)message
                  title:(NSString *)title
            buttonTitle:(NSString *)buttonTitle
      cancelButtonTitle:(NSString *)cancelButtonTitle
             completion:(choiceCompletionBlock)completion {
    
    [self vb_showActionSheet:message
                    title:title
             buttonTitles:@[buttonTitle]
        cancelButtonTitle:cancelButtonTitle
               completion:completion];
    
}
/**
 自定义单选弹层
 */
+ (void)vb_showActionSheet:(NSString *)message
                  title:(NSString *)title
           buttonTitles:(NSArray<NSString *> *)buttonTitles
      cancelButtonTitle:(NSString *)cancelButtonTitle
             completion:(choiceCompletionBlock)completion {
    
    NSMutableArray *actionArr = [NSMutableArray array];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             
                                                             NSInteger index = [_alertCtrl.actions indexOfObject:action];
                                                             completion(index, action);
                                                         }];
    [actionArr addObject:cancelAction];
    for (NSString *buttontitle in buttonTitles) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:buttontitle
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           if (completion) {
                                                               
                                                               NSInteger index = [_alertCtrl.actions indexOfObject:action];
                                                               completion(index, action);
                                                           }
                                                       }];
        [actionArr addObject:action];
    }
    
    [self vb_showCommonAlert:message
                    title:title
                    style:UIAlertControllerStyleActionSheet
              actionArray:actionArr];
}

#pragma mark - common alertView
/**
 通用提示弹层
 */
+ (void)vb_showCommonAlert:(NSString *)message
                  title:(NSString *)title
                  style:(UIAlertControllerStyle)style
           actionObject:(UIAlertAction *)actionObject, ... NS_REQUIRES_NIL_TERMINATION {
    
    _alertCtrl = nil;
    _alertCtrl = [UIAlertController alertControllerWithTitle:title
                                                     message:message
                                              preferredStyle:style];
    va_list args;
    va_start(args, actionObject);
    
    for (UIAlertAction *action = actionObject; action != nil; action = va_arg(args, UIAlertAction*)) {
        [_alertCtrl addAction:action];
    }
    va_end(args);
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [[window vb_currentViewController] presentViewController:_alertCtrl animated:YES completion:nil];
}

+ (void)vb_showCommonAlert:(NSString *)message
                  title:(NSString *)title
                  style:(UIAlertControllerStyle)style
            actionArray:(NSArray<UIAlertAction *> *)actionArray {
    
    _alertCtrl = nil;
    _alertCtrl = [UIAlertController alertControllerWithTitle:title
                                                     message:message
                                              preferredStyle:style];
    for (UIAlertAction *action in actionArray) {
        [_alertCtrl addAction:action];
    }
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [[window vb_currentViewController] presentViewController:_alertCtrl animated:YES completion:nil];
}



@end
