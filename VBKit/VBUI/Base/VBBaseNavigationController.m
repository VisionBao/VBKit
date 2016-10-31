//
//  VBBaseNavigationController.m
//  VBKit
//
//  Created by Vision on 9/23/16.
//  Copyright © 2016 VisionBao. All rights reserved.
//

#import "VBBaseNavigationController.h"

@interface VBBaseNavigationController ()

@end

@implementation VBBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - StatusBar
//View controller-based status bar appearance = YES  (info.plist)
- (UIStatusBarStyle)preferredStatusBarStyle {
    return _vb_BarStyleLightContent ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return _vb_barHidden;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationFade;
}

#pragma mark - setter
- (void)setVb_barStyleDefault:(BOOL)vb_barStyleDefault {
    _vb_BarStyleLightContent = vb_barStyleDefault;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)setVb_barHidden:(BOOL)vb_barHidden {
    _vb_barHidden = vb_barHidden;
    [self setNeedsStatusBarAppearanceUpdate];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
