//
//  UIImage+VBImage.h
//  VBKitExample
//
//  Created by Vision on 2017/3/1.
//  Copyright © 2017年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (VBImage)

+ (UIImage *)vb_imageWithFile:(NSString *)fileName;

+ (UIImage *)vb_imageWithFile:(NSString *)fileName ext:(NSString *)ext;

@end
