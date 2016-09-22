//
//  VBFMEncryptHelper.h
//  VBMusic
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface VBFMEncryptHelper : NSObject

/** 对数据库加密 */
+ (BOOL)encryptDatabase:(NSString *)path;

/** 对数据库解密 */
+ (BOOL)unEncryptDatabase:(NSString *)path;

/** 对数据库加密 */
+ (BOOL)encryptDatabase:(NSString *)sourcePath targetPath:(NSString *)targetPath;

/** 对数据库解密 */
+ (BOOL)unEncryptDatabase:(NSString *)sourcePath targetPath:(NSString *)targetPath;

/** 修改数据库秘钥 */
+ (BOOL)changeKey:(NSString *)dbPath originKey:(NSString *)originKey newKey:(NSString *)newKey;

@end
