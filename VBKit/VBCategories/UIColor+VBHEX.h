//
//  UIColor+VBHEX.h
//  VBKitExample
//
//  Created by Vision on 12/10/2016.
//  Copyright © 2016 VisionBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(VBHEX)

+ (UIColor *)vb_colorWithHex:(UInt32)hex;
+ (UIColor *)vb_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)vb_colorWithHexString:(NSString *)hexString;
- (NSString *)vb_HEXString;

@end
