//
//  VBViewController.h
//  VBKitExample
//
//  Created by Vision on 2016/11/12.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VBNavigationBar.h"
#import "VBView.h"

@interface VBViewController : UIViewController
@property (nonatomic, strong, readonly) VBNavigationBar *navBar;
@property (nonatomic, strong, readonly) UINavigationItem *navItem;

@property (nonatomic, strong, readonly) UIButton *backUpButton;
@property (nonatomic, strong, readonly) UIButton *rightMenuButton;

#pragma mark -
#pragma mark Navigation Control
//nav
- (void)vb_initNavBar;

//title
- (void)vb_initNavBarWithTitle:(NSString *)title
                  tintColor:(UIColor *)tintColor;
- (void)vb_initNavBarWithImageName:(NSString *)imageName
                      tintColor:(UIColor *)tintColor;;
- (void)vb_initNavBarWithCustomView:(UIView *)view
                       tintColor:(UIColor *)tintColor;;
//left
- (void)vb_addBackButtonItem;
- (void)vb_addBackButtonItemWithTitle:(NSString *)title
                           backImg:(NSString *)backImg;
//right
- (void)vb_addRightButtonItem;
- (void)vb_addCheckButtonItem;
- (void)vb_addCloseButtonItem;
- (void)vb_addRightButtonItemWithTitle:(NSString *)title
                            backImg:(NSString *)backImg;
//hide
- (void)vb_hideNavigationBar:(BOOL)hide
                 animated:(BOOL)animated
                   finish:(void(^)(void))finishBlock;

//action
- (void)vb_backButtonItemClick;
- (void)vb_rightButtonItemClick;

@end
