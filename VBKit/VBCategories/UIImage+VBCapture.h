//
//  UIImage+VBCapture.h
//  VBKitExample
//
//  Created by Vision on 2016/12/26.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (VBCapture)

+ (UIImage *)vb_captureWithView:(UIView *)view;

+ (UIImage *)vb_getImageWithSize:(CGRect)myImageRect FromImage:(UIImage *)bigImage;

+ (UIImage *)vb_screenshotWithView:(UIView *)aView limitWidth:(CGFloat)maxWidth;
@end
