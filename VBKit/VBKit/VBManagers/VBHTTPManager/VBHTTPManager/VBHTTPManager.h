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

/**
 请求成功block
 */
typedef void (^requestSuccessBlock)(id responseObj);

/**
 请求失败block
 */
typedef void (^requestFailureBlock) (NSError *error);

/**
 请求响应block
 */
typedef void (^responseBlock)(id dataObj,NSURL *filePath, NSError *error);

/**
 监听进度响应block
 */
typedef void (^progressBlock)(int64_t bytesWritten, int64_t totalBytesWritten);

@interface VBHTTPManager : NSObject

+ (id)defaultManager;


/**
 GET请求
 */
- (void)getRequest:(NSString *)url
            params:(NSDictionary *)params
           success:(requestSuccessBlock)successHandler
           failure:(requestFailureBlock)failureHandler;

/**
 POST请求
 */
- (void)postRequest:(NSString *)url
             params:(NSDictionary *)params
            success:(requestSuccessBlock)successHandler
            failure:(requestFailureBlock)failureHandler;

/**
 PUT请求
 */
- (void)putRequest:(NSString *)url
            params:(NSDictionary *)params
           success:(requestSuccessBlock)successHandler
           failure:(requestFailureBlock)failureHandler;

/**
 DELETE请求
 */
- (void)deleteRequest:(NSString *)url
               params:(NSDictionary *)params
              success:(requestSuccessBlock)successHandler
              failure:(requestFailureBlock)failureHandler;

/**
 下载文件，监听下载进度
 */
- (void)downloadRequest:(NSString *)url
               filePath:(NSString *)filePath
     successAndProgress:(progressBlock)progressHandler
               complete:(responseBlock)completionHandler;
/**
 文件上传
 */
- (void)updateRequest:(NSString *)url
               params:(NSDictionary *)params
           fileConfig:(VBFileConfig *)fileConfig
              success:(requestSuccessBlock)successHandler
              failure:(requestFailureBlock)failureHandler;

/**
 文件上传，监听上传进度
 */
- (void)updateRequest:(NSString *)url
               params:(NSDictionary *)params
           fileConfig:(VBFileConfig *)fileConfig
   successAndProgress:(progressBlock)progressHandler
             complete:(responseBlock)completionHandler;
@end

