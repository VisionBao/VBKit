//
//  UIImage+VBImageEffects.h
//  VBKitExample
//
//  Created by Vision on 2016/12/26.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (VBImageEffects)

- (UIImage *)vb_applyLightEffect;
- (UIImage *)vb_applyExtraLightEffect;
- (UIImage *)vb_applyDarkEffect;
- (UIImage *)vb_applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)vb_applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;


@end
