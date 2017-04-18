//
//  VBHTTPManager.m
//  VBKit
//
//  Created by Vision on 15/12/5.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import "VBHTTPManager.h"
#import "VBFileConfig.h"
#import "VBHTTPCacheManager.h"

@interface VBHTTPManager ()
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@property (nonatomic, strong) AFNetworkReachabilityManager *reachabilityManager;

@property (nonatomic, assign) NSTimeInterval vb_timeout; //超时
@property (nonatomic, strong) NSDictionary *httpHeaders; //headers
@property (nonatomic, strong) NSDictionary *httpHeaderstemp; //临时headers

@property (nonatomic, strong) NSMutableArray *taskArray;

@end

@implementation VBHTTPManager

+ (instancetype)shareManager {
    static VBHTTPManager *httpManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpManager = [[VBHTTPManager alloc] init];
    });
    return httpManager;
}

- (id)init {
    self = [super init];
    if (self) {
        
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
        _vb_timeout = 60.0f;
        _reachabilityManager = [AFNetworkReachabilityManager sharedManager];
        [_reachabilityManager startMonitoring];
        _taskArray = [NSMutableArray array];
    }
    return self;
}

- (void)setTimeout:(NSTimeInterval)timeout {
    _vb_timeout = timeout;
    _sessionManager.requestSerializer.timeoutInterval = _vb_timeout;
}

//设置header
- (void)setCommonHttpHeaders:(NSDictionary<NSString *, NSString *> *)httpHeaders {
    _httpHeaders = httpHeaders;
    [self configCommonHeaders];
}
//设置临时header
- (void)setTempHttpHeaders:(NSDictionary<NSString *, NSString *> *)httpHeaders {
    _httpHeaderstemp = httpHeaders;
    [self configTempHeaders];
}
- (void)cancelAllRequest {
    
    @synchronized(self) {
        [self.taskArray enumerateObjectsUsingBlock:^(NSURLSessionTask  *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            [task cancel];
        }];
        [self.taskArray removeAllObjects];
    }
}

- (void)cancelRequestWithURL:(NSString *)URL {
    
    if (!URL) { return; }
    @synchronized (self) {
        [self.taskArray enumerateObjectsUsingBlock:^(NSURLSessionTask  *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([task.currentRequest.URL.absoluteString hasPrefix:URL]) {
                [task cancel];
                [self.taskArray removeObject:task];
                *stop = YES;
            }
        }];
    }
}
/**
 GET请求
 */
- (NSURLSessionTask *)getRequest:(NSString *)url
                          params:(NSDictionary *)params
                         success:(RequestSuccessBlock)successHandler
                         failure:(RequestFailureBlock)failureHandler {
    
    
    return [self getRequest:url
                     params:params
              responseCache:nil
                    success:successHandler
                    failure:failureHandler];
}

- (NSURLSessionTask *)getRequest:(NSString *)url
                          params:(NSDictionary *)params
                   responseCache:(RequestCacheBlock)responseCache
                         success:(RequestSuccessBlock)successHandler
                         failure:(RequestFailureBlock)failureHandler {
    
    [self configTempHeaders];
    responseCache ? responseCache([VBHTTPCacheManager httpCacheForURL:url parameters:params]) : nil;
    __weak __typeof(&*self)weakSelf = self;
    NSURLSessionTask *sessionTask =
    [self.sessionManager GET:url
                  parameters:params
                    progress:^(NSProgress * _Nonnull downloadProgress) {
                        
                    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        __strong __typeof__(weakSelf) strongSelf = weakSelf;
                        [strongSelf.taskArray removeObject:task];
                        successHandler ? successHandler(responseObject, task) : nil;
                        responseCache ? [VBHTTPCacheManager setHttpCache:responseObject URL:url parameters:params] : nil;
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        __strong __typeof__(weakSelf) strongSelf = weakSelf;
                        [strongSelf.taskArray removeObject:task];
                        failureHandler ? failureHandler(error, task) : nil;
                    }];
    sessionTask ? [self.taskArray addObject:sessionTask] : nil;
    [self clearTempHeaders];
    return sessionTask;
}

/**
 POST请求
 */
- (NSURLSessionTask *)postRequest:(NSString *)url
                           params:(NSDictionary *)params
                          success:(RequestSuccessBlock)successHandler
                          failure:(RequestFailureBlock)failureHandler {
    
    return [self postRequest:url
                      params:params
               responseCache:nil
                     success:successHandler
                     failure:failureHandler];
}

/**
 POST请求(缓存)
 */
- (NSURLSessionTask *)postRequest:(NSString *)url
                           params:(NSDictionary *)params
                    responseCache:(RequestCacheBlock)responseCache
                          success:(RequestSuccessBlock)successHandler
                          failure:(RequestFailureBlock)failureHandler {
    
    [self configTempHeaders];
    responseCache ? responseCache([VBHTTPCacheManager httpCacheForURL:url parameters:params]) : nil;
    __weak __typeof(&*self)weakSelf = self;
    NSURLSessionTask *sessionTask =
    [self.sessionManager POST:url
                   parameters:params
                     progress:^(NSProgress * _Nonnull uploadProgress) {
                         
                     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                         __strong __typeof__(weakSelf) strongSelf = weakSelf;
                         [strongSelf.taskArray removeObject:task];
                         successHandler ? successHandler(responseObject, task) : nil;
                         responseCache ? [VBHTTPCacheManager setHttpCache:responseObject URL:url parameters:params] : nil;
                     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                         __strong __typeof__(weakSelf) strongSelf = weakSelf;
                         [strongSelf.taskArray removeObject:task];
                         failureHandler ? failureHandler(error, task) : nil;
                     }];
    
    sessionTask ? [self.taskArray addObject:sessionTask] : nil;
    [self clearTempHeaders];
    return sessionTask;
}


/**
 PUT请求
 */
- (NSURLSessionTask *)putRequest:(NSString *)url
                          params:(NSDictionary *)params
                         success:(RequestSuccessBlock)successHandler
                         failure:(RequestFailureBlock)failureHandler {
    [self configTempHeaders];
    __weak __typeof(&*self)weakSelf = self;
    NSURLSessionTask *sessionTask =
    [self.sessionManager PUT:url
                  parameters:params
                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                         __strong __typeof__(weakSelf) strongSelf = weakSelf;
                         [strongSelf.taskArray removeObject:task];
                         successHandler ? successHandler(responseObject, task) : nil;
                     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                         __strong __typeof__(weakSelf) strongSelf = weakSelf;
                         [strongSelf.taskArray removeObject:task];
                         failureHandler ? failureHandler(error, task) : nil;
                     }];
    sessionTask ? [self.taskArray addObject:sessionTask] : nil;
    [self clearTempHeaders];
    return sessionTask;
}

/**
 DELETE请求
 */
- (NSURLSessionTask *)deleteRequest:(NSString *)url
                             params:(NSDictionary *)params
                            success:(RequestSuccessBlock)successHandler
                            failure:(RequestFailureBlock)failureHandler {
    [self configTempHeaders];
    __weak __typeof(&*self)weakSelf = self;
    NSURLSessionTask *sessionTask =
    [self.sessionManager DELETE:url
                     parameters:params
                        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                            __strong __typeof__(weakSelf) strongSelf = weakSelf;
                            [strongSelf.taskArray removeObject:task];
                            successHandler ? successHandler(responseObject, task) : nil;
                        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                            __strong __typeof__(weakSelf) strongSelf = weakSelf;
                            [strongSelf.taskArray removeObject:task];
                            failureHandler ? failureHandler(error, task) : nil;
                        }];
    sessionTask ? [self.taskArray addObject:sessionTask] : nil;
    [self clearTempHeaders];
    return sessionTask;
}

/**
 下载文件，监听下载进度
 */
- (NSURLSessionTask *)downloadRequest:(NSString *)url
                             filePath:(NSString *)filePath
                   successAndProgress:(ProgressBlock)progressHandler
                             complete:(ResponseBlock)completionHandler {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    __weak __typeof(&*self)weakSelf = self;
    NSURLSessionDownloadTask *downloadTask;
    __weak __typeof(NSURLSessionDownloadTask *)weakTask = downloadTask;
    downloadTask =
    [manager downloadTaskWithRequest:request
                            progress:^(NSProgress * _Nonnull downloadProgress) {
                                progressHandler ? progressHandler(downloadProgress.completedUnitCount, downloadProgress.totalUnitCount) : nil;
                            } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                                NSURL *downloadUrl = [NSURL fileURLWithPath:filePath];
                                NSURL *finalUrl =[downloadUrl URLByAppendingPathComponent:[response suggestedFilename]];
                                return finalUrl;
                            } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                                __strong __typeof__(weakSelf) strongSelf = weakSelf;
                                __strong __typeof(NSURLSessionDownloadTask *)strongTask = weakTask;
                                [strongSelf.taskArray removeObject:strongTask];
                                completionHandler ? completionHandler(response, filePath, error) : nil;
                            }];
    
    [downloadTask resume];
    downloadTask ? [self.taskArray addObject:downloadTask] : nil;
    return downloadTask;
}
/**
 文件上传
 */
- (NSURLSessionTask *)updateRequest:(NSString *)url
                             params:(NSDictionary *)params
                         fileConfig:(VBFileConfig *)fileConfig
                            success:(RequestSuccessBlock)successHandler
                            failure:(RequestFailureBlock)failureHandler {
    
    return [self updateRequest:url
                        params:params
                    fileConfig:fileConfig
            successAndProgress:nil
                       success:successHandler
                       failure:failureHandler];
}

/**
 文件上传，监听上传进度
 */
- (NSURLSessionTask *)updateRequest:(NSString *)url
                             params:(NSDictionary *)params
                         fileConfig:(VBFileConfig *)fileConfig
                 successAndProgress:(ProgressBlock)progressHandler
                            success:(RequestSuccessBlock)successHandler
                            failure:(RequestFailureBlock)failureHandler {
    
    [self configTempHeaders];
    __weak __typeof(&*self)weakSelf = self;
    NSURLSessionTask *sessionTask =
    [self.sessionManager POST:url
                   parameters:params
    constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:fileConfig.fileData
                                    name:fileConfig.name
                                fileName:fileConfig.fileName
                                mimeType:fileConfig.mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progressHandler ? progressHandler(uploadProgress.completedUnitCount, uploadProgress.totalUnitCount) : nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        __strong __typeof__(weakSelf) strongSelf = weakSelf;
        [strongSelf.taskArray removeObject:task];
        successHandler ? successHandler(responseObject, task) : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        __strong __typeof__(weakSelf) strongSelf = weakSelf;
        [strongSelf.taskArray removeObject:task];
        failureHandler ? failureHandler(error, task) : nil;
    }];
    sessionTask ? [self.taskArray addObject:sessionTask] : nil;
    [self clearTempHeaders];
    return sessionTask;
}
#pragma mark - private method

- (void)configCommonHeaders {
    
    for (NSString *key in _httpHeaders.allKeys) {
        if (_httpHeaders[key] != nil) {
            [_sessionManager.requestSerializer setValue:_httpHeaders[key] forHTTPHeaderField:key];
        }
    }
}

- (void)configTempHeaders {
    
    if (!_httpHeaderstemp) {
        return;
    }
    [self clearCommonHeaders];
    for (NSString *key in _httpHeaderstemp.allKeys) {
        if (_httpHeaderstemp[key] != nil) {
            [_sessionManager.requestSerializer setValue:_httpHeaderstemp[key] forHTTPHeaderField:key];
        }
    }
}

//清除通用请求头设置
- (void)clearCommonHeaders {
    
    for (NSString *key in _httpHeaders.allKeys) {
        if (_httpHeaders[key] != nil) {
            [_sessionManager.requestSerializer setValue:nil forHTTPHeaderField:key];
        }
    }
}
//清除临时请求头设置
- (void)clearTempHeaders {
    
    if (!_httpHeaderstemp) {
        return;
    }
    for (NSString *key in _httpHeaderstemp.allKeys) {
        if (_httpHeaderstemp[key] != nil) {
            [_sessionManager.requestSerializer setValue:nil forHTTPHeaderField:key];
        }
    }
    _httpHeaderstemp = nil;
    [self configCommonHeaders];
}

- (NSMutableArray *)taskArray {
    
    if (!_taskArray) {
        _taskArray = [NSMutableArray array];
    }
    return _taskArray;
}

@end



