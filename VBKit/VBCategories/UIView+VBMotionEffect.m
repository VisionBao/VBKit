//
//  UIView+VBMotionEffect.m
//  VBKit
//
//  Created by Vision on 15/12/25.
//  Copyright © 2015年 VisionBao. All rights reserved.
//



#import "UIView+VBMotionEffect.h"

@implementation UIView (VBMotionEffect)

- (void)vb_registerMotionEffectWithdepth:(CGFloat)depth
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0f) {
        return;
    }
    UIInterpolatingMotionEffect *effectX;
    UIInterpolatingMotionEffect *effectY;
    effectX = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                              type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    effectY = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                              type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    
    
    effectX.maximumRelativeValue = @(depth);
    effectX.minimumRelativeValue = @(-depth);
    effectY.maximumRelativeValue = @(depth);
    effectY.minimumRelativeValue = @(-depth);
    
    [self addMotionEffect:effectX];
    [self addMotionEffect:effectY];
}
@end
