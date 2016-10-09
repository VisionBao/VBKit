//
//  VBBaseViewController.h
//  VBKit
//
//  Created by Vision on 9/23/16.
//  Copyright © 2016 VisionBao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VBBaseNavigationBar.h"
#import "VBBaseView.h"

@interface VBBaseViewController : UIViewController

@property (nonatomic, strong, readonly) VBBaseNavigationBar *navBar;
@property (nonatomic, strong, readonly) UINavigationItem *navItem;

@property (nonatomic, strong, readonly) UIButton *backUpButton;
@property (nonatomic, strong, readonly) UIButton *rightMenuButton;

#pragma mark -
#pragma mark Navigation Control
//nav
- (void)initNavBar;

//title
- (void)initNavBarWithTitle:(NSString *)title;
- (void)initNavBarWithImageName:(NSString *)imageName;
- (void)initNavBarWithCustomView:(UIView *)view;
//left
- (void)addBackButtonItem;
- (void)addBackButtonItemWithTitle:(NSString *)title
                             backImg:(NSString *)backImg;
//right
- (void)addRightButtonItem;
- (void)addCheckButtonItem;
- (void)addCloseButtonItem;
- (void)addRightButtonItemWithTitle:(NSString *)title
                              backImg:(NSString *)backImg;
//hide
- (void)hideNavigationBar:(BOOL)hide
                 animated:(BOOL)animated
                   finish:(void(^)(void))finishBlock;

//action
- (void)backButtonItemClick;
- (void)rightButtonItemClick;
@end
