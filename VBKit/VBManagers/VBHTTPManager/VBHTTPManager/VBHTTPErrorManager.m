//
//  VBHTTPErrorManager.m
//  VBKit
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import "VBHTTPErrorManager.h"

typedef enum {
    // 具有通用意义的错误码
    ErrorCode_Success = 20000,
    ErrorCode_NoData = 1003,
    ErrorCode_LoginError = 20002,
    ErrorCode_NOLogin = 20004,
    ErrorCode_paramError = 1001,
    ErrorCode_SystemError = 503,
} VBHTTPErrorCode;

@implementation VBHTTPErrorManager

@end
