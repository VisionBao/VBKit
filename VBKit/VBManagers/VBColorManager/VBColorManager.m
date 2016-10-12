//
//  VBColorManager.m
//  VBKit
//
//  Created by Vision on 15/12/24.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import "VBColorManager.h"
#import "UIColor+VBHEX.h"

@implementation VBColorManager

+ (UIColor *)colorWithHomeColor {
    return [UIColor vb_colorWithHexString:@"00aded"];
}

+ (UIColor *)colorWithlittleGray{
    return [UIColor vb_colorWithHexString:@"F4F5F6"];
}

+ (UIColor *)colorWithRedColor {
    return [UIColor vb_colorWithHex:0xed1f52];
}

+ (UIColor *)colorWithBlueColor {
    return [UIColor vb_colorWithHex:0x00aded];
}

+ (UIColor *)colorWithLightGrayColor {
    return [UIColor vb_colorWithHex:0xacacac];
}

+ (UIColor *)colorWithGrayColor {
    return [UIColor vb_colorWithHex:0x665f5c];
}

+ (UIColor *)colorWithBlackColor {
    return [UIColor vb_colorWithHex:0x38322f];
}

+ (UIColor *)colorWithTLGrayColor {
    return [UIColor vb_colorWithHex:0xd8d8d8];
}

+ (UIColor *)colorWithTGrayColor {
    return [UIColor vb_colorWithHex:0xa2b1ba];
}

+ (UIColor *)colorWithTabbarColor {
    return [UIColor vb_colorWithHex:0x2F3442];
}

+ (UIColor *)colorWithLineColor {
    return [UIColor vb_colorWithHex:0xd8d8d8];
}

+ (UIColor *)colorWithViewBackground {
    return [UIColor whiteColor];
}

+ (UIColor *)colorWithWhiteColor {
    return [UIColor whiteColor];
}



@end
