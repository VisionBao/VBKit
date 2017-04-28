//
//  NSString+VBHash.h
//  Gongyu
//
//  Created by Vision on 16/4/19.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (VBHash)

@property (readonly) NSString *vb_md5String;
@property (readonly) NSString *vb_md5String16Bate;

@property (readonly) NSString *vb_sha1String;
@property (readonly) NSString *vb_sha256String;
@property (readonly) NSString *vb_sha512String;

- (NSString *)vb_hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)vb_hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)vb_hmacSHA512StringWithKey:(NSString *)key;

@end
