//
//  VBDBManager.h
//  VBKit
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import <FMDB.h>
#import "VBFMDBEncrypt.h"

#define ARRAYSIZE(A) (sizeof(A)/sizeof((A)[0]))


/**
 *  数据库管理基类
 */
@interface VBDBManager : NSObject{
    VBFMEncryptDatabaseQueue *_dbQueue;
}

+ (id)shareManager;
+ (void)setEncryptKey:(NSString *)Key;

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
