//
//  NSString+VBBase64.m
//  Gongyu
//
//  Created by Vision on 16/4/19.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import "NSString+VBBase64.h"
#import "NSData+VBBase64.h"

@implementation NSString (VBBase64)
+ (NSString *)vb_stringWithBase64EncodedString:(NSString *)string
{
    NSData *data = [NSData vb_dataWithBase64EncodedString:string];
    if (data)
    {
        return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}
- (NSString *)vb_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data vb_base64EncodedStringWithWrapWidth:wrapWidth];
}
- (NSString *)vb_base64EncodedString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data vb_base64EncodedString];
}
- (NSString *)vb_base64DecodedString
{
    return [NSString vb_stringWithBase64EncodedString:self];
}
- (NSData *)vb_base64DecodedData
{
    return [NSData vb_dataWithBase64EncodedString:self];
}
@end
