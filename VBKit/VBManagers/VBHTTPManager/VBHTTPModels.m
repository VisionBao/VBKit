//
//  VBHTTPModels.m
//  VBKit
//
//  Created by Vision on 15/12/24.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import "VBHTTPModels.h"
#import "VBHttpUrlManager.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

static NSString *secretKey = @"7f3dd901ad3742e9abe60ded914fc9c0";

@implementation VBHTTPModels

+ (id)defaultManager{
    static VBHTTPModels *httpModels = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpModels = [[VBHTTPModels alloc] init];

    });
    return httpModels;
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - 基础请求参数
//获取基础参数字典
- (NSMutableDictionary *)getBaseParams{
    NSDictionary *baseParamDic = @{@"secretId": @"gongyu",
                                   @"timestamp": [self getTimestamp],
                                   @"nonce": [self generateNonce],
                                   @"version": [self getAppVersion],
                                   @"source": @"iOS",
                                   };
    return baseParamDic.mutableCopy;
}

//通过参数获取Signature
- (NSString *)getSignatureWithParamsDic:(NSDictionary *)paramsDic
                                 andUrl:(NSString *)url{
    
    NSMutableString *signature = [NSString stringWithFormat:@"%@?", url].mutableCopy;
    NSRange hostRange = {0, [[[VBHttpUrlManager defaultManager] getHostUrl] length]};
    [signature deleteCharactersInRange:hostRange];
    
    NSArray *dicKey = [paramsDic allKeys];
    NSArray *finalArr = [dicKey sortedArrayUsingSelector:@selector(compare:)];
    for (NSString *temp in finalArr) {
        if ([temp isEqualToString:[finalArr lastObject]]) {
            [signature appendFormat:@"%@=%@", temp, [paramsDic objectForKey:temp]];
        } else {
            
            [signature appendFormat:@"%@=%@&", temp, [paramsDic objectForKey:temp]];
        }
    }
    
    return [self getSignature:signature];
}

//获取nonce
- (NSString *)generateNonce {
    return [NSString stringWithFormat:@"%u",
            arc4random() % (999999999 - 100000000) + 100000000];
}

//获取版本号
- (NSString*)getAppVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
   return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

//获取时间戳
- (NSString *)getTimestamp{
    return [NSString stringWithFormat:@"%lld",(long long)[[NSDate date] timeIntervalSince1970] * 1000];
    
}

//获取Signature 签名验证
- (NSString *)getSignature:(NSString *)data{

    const char *cKey  = [secretKey cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];
    
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC
                                          length:sizeof(cHMAC)];
    
    NSString *hash = [HMAC vb_base64EncodedString];
    
    return [hash vb_urlEncode];
}
//获取页码
- (NSString *)getPageNum:(NSInteger)page{
    return [NSString stringWithFormat:@"%zd", page];
}

@end
