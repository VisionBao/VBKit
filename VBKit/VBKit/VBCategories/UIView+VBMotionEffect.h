//
//  UIView+VBMotionEffect.h
//  VBKit
//
//  Created by Vision on 15/12/25.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (VBMotionEffect)
/**
 *  MotionEffect效果(类似壁纸透视)(iOS7以后)
 *
 *  @param depth 偏移量
 */
- (void)vb_registerMotionEffectWithdepth:(CGFloat)depth;

@end
