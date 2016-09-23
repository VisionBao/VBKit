//
//  VBBaseViewController.m
//  VBKit
//
//  Created by Vision on 9/23/16.
//  Copyright © 2016 VisionBao. All rights reserved.
//

#import "VBBaseViewController.h"

@interface VBBaseViewController ()
@property (nonatomic, strong) VBBaseNavigationBar *navBar;
@property (nonatomic, strong) UINavigationItem *navItem;

@property (nonatomic, strong) UIButton *backUpButton;
@property (nonatomic, strong) UIButton *rightMenuButton;
@end

@implementation VBBaseViewController

- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.clipsToBounds = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;

}

- (void)initNavBar {
    if (!_navBar) {
        _navBar = [[VBBaseNavigationBar alloc] init];
        _navItem = [[UINavigationItem alloc] init];
        
        [_navBar setFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAVIGATION_BAR_HEIGHT)];
        [_navBar setTranslucent:NO];
        [_navBar pushNavigationItem:_navItem animated:NO];
        [_navBar setBarTintColor:[VBColorManager colorWithHomeColor]];
        [_navBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[VBColorManager colorWithWhiteColor],
                                         NSForegroundColorAttributeName,
                                         [UIFont fontWithName:@"Arial Rounded MT Bold" size:17],
                                         NSFontAttributeName, nil]];
        
        [self.view addSubview:_navBar];
    }
}

- (void)settingStatusBarWhite:(BOOL)white {
//    if (white) {
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
//    } else {
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
//    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationFade;
}
@end
