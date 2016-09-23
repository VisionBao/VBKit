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
//info - View controller-based status bar appearance   NO
- (void)settingStatusBarWhite:(BOOL)white;
//title
- (void)initNavBarWithTitle:(NSString *)title;
- (void)initNavBarWithImage:(UIImage *)image;
- (void)initNavBarWithTitle:(NSString *)title
                   bgImage:(UIImage *)bgImage;
//left
- (void)addBackButtonItem;
- (void)addBackButtonItemWithTitle:(NSString *)title
                             image:(UIImage *)image;
//right
- (void)addRightButtonItem;
- (void)addRightButtonItemWithTitle:(NSString *)title
                              image:(UIImage *)image;
//hide
- (void)hideNavigationBar;
- (void)autoHidehideNavigationBar;

@end
