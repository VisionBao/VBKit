//
//  VBHTTPManager.h
//  VBKit
//
//  Created by Vision on 15/12/5.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
@class VBFileConfig;

typedef NS_ENUM(NSInteger, VBNetworkStatus) {
    VBNetworkStatusUnknown          = -1,//未知网络
    VBNetworkStatusNotReachable     = 0,//网络无连接
    VBNetworkStatusReachableViaWWAN = 1,//2，3，4G网络
    VBNetworkStatusReachableViaWiFi = 2,//WIFI网络
};

typedef NS_ENUM(NSInteger, VBNetworkCacheType) {
    VBNetworkCacheTypeNoCache     = 0, //无缓存
    VBNetworkCacheTypeCache       = 1, //缓存
    VBNetworkCacheTypeIgnoreCache = 2, //忽略缓存请求
    VBNetworkCacheTypeOnlyCache   = 3, //只读缓存
};


/**
 缓存的Block
 */
typedef void(^RequestCacheBlock)(id responseCache);

/**
 请求成功block
 */
typedef void (^RequestSuccessBlock)(id responseObj);

/**
 请求失败block
 */
typedef void (^RequestFailureBlock)(NSError *error);

/**
 请求响应block
 */
typedef void (^ResponseBlock)(id dataObj, NSURL *filePath, NSError *error);

/**
 监听进度响应block
 */
typedef void (^ProgressBlock)(int64_t bytesWritten, int64_t totalBytesWritten);

@interface VBHTTPManager : NSObject

@property (nonatomic, readonly) AFNetworkReachabilityManager *reachabilityManager;

+ (instancetype)shareManager;

//设置timeout 默认60s
- (void)setTimeout:(NSTimeInterval)timeout;
//设置header
- (void)setCommonHttpHeaders:(NSDictionary<NSString *, NSString *> *)httpHeaders;

/**
 GET请求(无缓存)
 */
- (NSURLSessionTask *)getRequest:(NSString *)url
                          params:(NSDictionary *)params
                         success:(RequestSuccessBlock)successHandler
                         failure:(RequestFailureBlock)failureHandler;

/**
 GET请求(缓存)
 */
- (NSURLSessionTask *)getRequest:(NSString *)url
                          params:(NSDictionary *)params
                   responseCache:(RequestCacheBlock)responseCache
                         success:(RequestSuccessBlock)successHandler
                         failure:(RequestFailureBlock)failureHandler;
/**
 POST请求(无缓存)
 */
- (NSURLSessionTask *)postRequest:(NSString *)url
                           params:(NSDictionary *)params
                          success:(RequestSuccessBlock)successHandler
                          failure:(RequestFailureBlock)failureHandler;
/**
 POST请求(缓存)
 */
- (NSURLSessionTask *)postRequest:(NSString *)url
                           params:(NSDictionary *)params
                    responseCache:(RequestCacheBlock)responseCache
                          success:(RequestSuccessBlock)successHandler
                          failure:(RequestFailureBlock)failureHandler;

/**
 PUT请求
 */
- (NSURLSessionTask *)putRequest:(NSString *)url
                              params:(NSDictionary *)params
                             success:(RequestSuccessBlock)successHandler
                             failure:(RequestFailureBlock)failureHandler;

/**
 DELETE请求
 */
- (NSURLSessionTask *)deleteRequest:(NSString *)url
                                 params:(NSDictionary *)params
                                success:(RequestSuccessBlock)successHandler
                                failure:(RequestFailureBlock)failureHandler;

/**
 下载文件，监听下载进度
 */
- (NSURLSessionTask *)downloadRequest:(NSString *)url
                                     filePath:(NSString *)filePath
                           successAndProgress:(ProgressBlock)progressHandler
                                     complete:(ResponseBlock)completionHandler;
/**
 文件上传
 */
- (NSURLSessionTask *)updateRequest:(NSString *)url
                                 params:(NSDictionary *)params
                             fileConfig:(VBFileConfig *)fileConfig
                                success:(RequestSuccessBlock)successHandler
                                failure:(RequestFailureBlock)failureHandler;

/**
 文件上传，监听上传进度
 */
- (NSURLSessionTask *)updateRequest:(NSString *)url
                             params:(NSDictionary *)params
                         fileConfig:(VBFileConfig *)fileConfig
                 successAndProgress:(ProgressBlock)progressHandler
                            success:(RequestSuccessBlock)successHandler
                            failure:(RequestFailureBlock)failureHandler;

- (void)cancelAllRequest;

- (void)cancelRequestWithURL:(NSString *)URL;

@end

