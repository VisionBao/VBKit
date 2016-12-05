//
//  VBProgressHUD.h
//  VBKitExample
//
//  Created by Vision on 2016/11/12.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VBProgressHUDMaskType) {
    VBProgressHUDMaskTypeDefault, //allow user touch when hud display
    VBProgressHUDMaskTypeClear,   //dont allowed user touch
    VBProgressHUDMaskTypeBlack,   //dont allowed user touch
    VBProgressHUDMaskTypeGradient //dont allowed user touch
};

//typedef NS_ENUM(NSInteger, VBProgressHUDMaskWithoutType) {
//    VBProgressHUDMaskWithoutDefault,        // default mask all
//    VBProgressHUDMaskWithoutNavigation,     //show mask without navigation
//    VBProgressHUDMaskWithoutTabbar,         //show mask without tabbar
//    VBProgressHUDMaskWithoutNavAndTabbar,   //show mask without tabbar and navigation
//};


@interface VBProgressHUD : UIView

@end
