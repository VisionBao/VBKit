//
//  VBHTTPCacheManager.m
//  VBKitExample
//
//  Created by Vision on 15/12/5.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import "VBHTTPCacheManager.h"

@implementation VBHTTPCacheManager
static NSString *const NetworkResponseCache = @"VBNetworkCache";
static YYCache *_dataCache;


+ (void)initialize {
    
    _dataCache = [YYCache cacheWithName:NetworkResponseCache];
}

+ (void)setHttpCache:(id)httpData
                 URL:(NSString *)URL
          parameters:(NSDictionary *)parameters {
    
    NSString *cacheKey = [self cacheKeyWithURL:URL
                                    parameters:parameters];
    [_dataCache setObject:httpData
                   forKey:cacheKey
                withBlock:nil];
}

+ (id)httpCacheForURL:(NSString *)URL
           parameters:(NSDictionary *)parameters {
    
    NSString *cacheKey = [self cacheKeyWithURL:URL
                                    parameters:parameters];
    return [_dataCache objectForKey:cacheKey];
}

+ (void)httpCacheForURL:(NSString *)URL
             parameters:(NSDictionary *)parameters
              withBlock:(void(^)(id<NSCoding> object))block {
    
    NSString *cacheKey = [self cacheKeyWithURL:URL
                                    parameters:parameters];
    [_dataCache objectForKey:cacheKey
                   withBlock:^(NSString * _Nonnull key, id<NSCoding>  _Nonnull object) {
        dispatch_async(dispatch_get_main_queue(), ^{
            block(object);
        });
    }];
}

+ (NSInteger)getAllHttpCacheSize {
    
    return [_dataCache.diskCache totalCost];
}

+ (void)removeAllHttpCache {
    
    [_dataCache.diskCache removeAllObjects];
}

+ (NSString *)cacheKeyWithURL:(NSString *)URL
                   parameters:(NSDictionary *)parameters {
    if(!parameters){return URL;};

    NSData *stringData = [NSJSONSerialization dataWithJSONObject:parameters
                                                         options:0
                                                           error:nil];
    NSString *paraString = [[NSString alloc] initWithData:stringData
                                                 encoding:NSUTF8StringEncoding];
    
    NSString *cacheKey = [NSString stringWithFormat:@"%@%@",URL,paraString];
    
    return cacheKey;
}



@end
