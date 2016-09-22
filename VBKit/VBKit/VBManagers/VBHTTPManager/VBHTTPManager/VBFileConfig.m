//
//  VBFileConfig.m
//  VBKit
//
//  Created by Vision on 15/12/22.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import "VBFileConfig.h"

@implementation VBFileConfig

+ (instancetype)fileConfigWithfileData:(NSData *)fileData name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType {
    return [[self alloc] initWithfileData:fileData name:name fileName:fileName mimeType:mimeType];
}

- (instancetype)initWithfileData:(NSData *)fileData name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType {
    if (self = [super init]) {
        
        _fileData = fileData;
        _name = name;
        _fileName = fileName;
        _mimeType = mimeType;
    }
    return self;
}

@end
