//
//  NSString+VBUrlEncode.m
//  Gongyu
//
//  Created by Vision on 16/4/19.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import "NSString+VBUrlEncode.h"

@implementation NSString (VBUrlEncode)

- (NSString *)vb_urlEncode {
    return [self vb_urlEncodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)vb_urlEncodeUsingEncoding:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (__bridge CFStringRef)self,NULL,(CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                 CFStringConvertNSStringEncodingToEncoding(encoding));
}

- (NSString *)vb_urlDecode {
    return [self vb_urlDecodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)vb_urlDecodeUsingEncoding:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                 (__bridge CFStringRef)self,CFSTR(""),CFStringConvertNSStringEncodingToEncoding(encoding));
}

- (NSDictionary *)vb_dictionaryFromURLParameters
{
    NSArray *pairs = [self componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val = [[kv objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [params setObject:val forKey:[kv objectAtIndex:0]];
    }
    return params;
}

@end
