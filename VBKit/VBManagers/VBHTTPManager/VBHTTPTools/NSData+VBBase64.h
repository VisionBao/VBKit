//
//  NSData+VBBase64.h
//  Gongyu
//
//  Created by Vision on 16/4/19.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (VBBase64)

+ (NSData *)vb_dataWithBase64EncodedString:(NSString *)string;
- (NSString *)vb_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)vb_base64EncodedString;

@end
