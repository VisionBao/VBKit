//
//  VBViewController.h
//  VBKit
//
//  Created by Vision on 15/12/24.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VBNavigationBar.h"
#import "VBView.h"

@interface VBViewController : UIViewController
@property (nonatomic, strong) VBNavigationBar *navBar;
@property (nonatomic, strong) UINavigationItem *navItem;

//@property (nonatomic, strong) VBView *bottomBarView;

@property (nonatomic, strong) UIButton *backUpButton;
@property (nonatomic, strong) UIButton *rightMenuButton;


- (void)initNavBar;

- (void)backBtnItemClick;

- (void)addBackUpBtn;
- (void)addRightPlayButton;

- (void)setNavBarTitle:(NSString *)string;

- (void)addLeftBtn:(NSString *)title backImg:(NSString *)backImg;
- (void)addRightBtn:(NSString *)title backImg:(NSString *)backImg;

@end
