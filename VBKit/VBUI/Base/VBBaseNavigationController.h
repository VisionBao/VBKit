//
//  VBBaseNavigationController.h
//  VBKit
//
//  Created by Vision on 9/23/16.
//  Copyright © 2016 VisionBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBBaseNavigationController : UINavigationController

@property (nonatomic, assign) BOOL vb_BarStyleLightContent;

@property (nonatomic, assign) BOOL vb_barHidden;

@property (nonatomic, assign) UIStatusBarAnimation vb_barAnimation;


@end
