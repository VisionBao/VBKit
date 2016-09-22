//
//  VBHTTPManager.m
//  VBKit
//
//  Created by Vision on 15/12/5.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import "VBHTTPManager.h"
#import "VBFileConfig.h"

@interface VBHTTPManager ()
@property (nonatomic, strong)AFHTTPSessionManager *sessionManager;
@property (nonatomic, strong)AFNetworkReachabilityManager *reachabilityManager;
@end

@implementation VBHTTPManager

+ (id)defaultManager{
    static VBHTTPManager *httpManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpManager = [[VBHTTPManager alloc] init];
    });
    return httpManager;
}
- (id)init{
    self = [super init];
    if (self) {
        _sessionManager = [AFHTTPSessionManager manager];
        _reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    }
    return self;
}


/**
 GET请求
 */
- (void)getRequest:(NSString *)url params:(NSDictionary *)params success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler{
    
    [[[VBHTTPManager defaultManager] sessionManager] GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureHandler(error);
    }];

}

/**
 POST请求
 */
- (void)postRequest:(NSString *)url params:(NSDictionary *)params success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler{

    [[[VBHTTPManager defaultManager] sessionManager] POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureHandler(error);
    }];
    

}

/**
 PUT请求
 */
- (void)putRequest:(NSString *)url params:(NSDictionary *)params success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler{

    [[[VBHTTPManager defaultManager] sessionManager] PUT:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successHandler(successHandler);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureHandler(error);
    }];
}

/**
 DELETE请求
 */
- (void)deleteRequest:(NSString *)url params:(NSDictionary *)params success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler{

    [[[VBHTTPManager defaultManager] sessionManager] DELETE:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureHandler(error);
    }];
}

/**
 下载文件，监听下载进度
 */
- (void)downloadRequest:(NSString *)url filePath:(NSString *)filePath successAndProgress:(progressBlock)progressHandler complete:(responseBlock)completionHandler{

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
         progressHandler(downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSURL *downloadUrl = [NSURL fileURLWithPath:filePath];
        NSURL *finalUrl =[downloadUrl URLByAppendingPathComponent:[response suggestedFilename]];
        return finalUrl;
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        completionHandler(response, filePath, error);
    }];
    [downloadTask resume];

}
/**
 文件上传
 */
- (void)updateRequest:(NSString *)url params:(NSDictionary *)params fileConfig:(VBFileConfig *)fileConfig success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler{

    [[[VBHTTPManager defaultManager] sessionManager] POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:fileConfig.fileData name:fileConfig.name fileName:fileConfig.fileName mimeType:fileConfig.mimeType];
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successHandler(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureHandler(error);
    }];
}

/**
 文件上传，监听上传进度
 */
- (void)updateRequest:(NSString *)url params:(NSDictionary *)params fileConfig:(VBFileConfig *)fileConfig successAndProgress:(progressBlock)progressHandler complete:(responseBlock)completionHandler{

    [[[VBHTTPManager defaultManager] sessionManager] POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:fileConfig.fileData name:fileConfig.name fileName:fileConfig.fileName mimeType:fileConfig.mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progressHandler(uploadProgress.completedUnitCount, uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject, nil, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(nil, nil, error);
    }];
}
@end



