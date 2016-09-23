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

@property (nonatomic, strong) VBBaseNavigationBar *navBar;
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
