//
//  UIImage+VBImage.m
//  VBKitExample
//
//  Created by Vision on 2017/3/1.
//  Copyright © 2017年 VisionBao. All rights reserved.
//

#import "UIImage+VBImage.h"

@implementation UIImage (VBImage)

+ (UIImage *)vb_imageWithFile:(NSString *)fileName {
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:nil]];
}

+ (UIImage *)vb_imageWithFile:(NSString *)fileName ext:(NSString *)ext {
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:ext]];

}

@end
