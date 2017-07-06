//
//  VBDBManager.h
//  VBKit
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBFMEncryptDatabaseQueue.h"
#import <FMDB.h>

#define ARRAYSIZE(A) (sizeof(A)/sizeof((A)[0]))


/**
 *  数据库管理基类
 */
@interface VBDBManager : NSObject

/**
 设置DB文件名
 请在初始化前设置

 @param Name 文件名
 */
+ (void)setDBName:(NSString *)Name;

/**
 设置DB密码
 请在初始化前设置 默认无密码

 @param Key 密码
 */
+ (void)setEncryptKey:(NSString *)Key;

+ (id)shareManager;

/** 加密 - 同文件 */
+ (BOOL)encryptDatabase:(NSString *)path
             encryptKey:(NSString *)encryptKey;

/** 解密 - 同文件 */
+ (BOOL)unEncryptDatabase:(NSString *)path
               encryptKey:(NSString *)encryptKey;

/** 加密 - 新文件 */
+ (BOOL)encryptDatabase:(NSString *)sourcePath
             targetPath:(NSString *)targetPath
             encryptKey:(NSString *)encryptKey;

/** 解密 - 新文件 */
+ (BOOL)unEncryptDatabase:(NSString *)sourcePath
               targetPath:(NSString *)targetPath
               encryptKey:(NSString *)encryptKey;

/** 更改密钥 */
+ (BOOL)changeKey:(NSString *)dbPath
        originKey:(NSString *)originKey
           newKey:(NSString *)newKey;

- (VBFMEncryptDatabaseQueue *)fmDabaseQueue;

@end
