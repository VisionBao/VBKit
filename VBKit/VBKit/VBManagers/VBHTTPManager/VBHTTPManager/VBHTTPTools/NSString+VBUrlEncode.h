//
//  NSString+VBUrlEncode.h
//  Gongyu
//
//  Created by Vision on 16/4/19.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (VBUrlEncode)
- (NSString *)vb_urlEncode;
- (NSString *)vb_urlEncodeUsingEncoding:(NSStringEncoding)encoding;

- (NSString *)vb_urlDecode;
- (NSString *)vb_urlDecodeUsingEncoding:(NSStringEncoding)encoding;

- (NSDictionary *)vb_dictionaryFromURLParameters;
@end
