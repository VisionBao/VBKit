//
//  VBFileManager.h
//  VBKit
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, VBFilePathType) {
    VBFilePATH_HOME,      // "~"
    VBFilePATH_APP,       // "/"
    VBFilePATH_LIBRARY,   // "/library"
    VBFilePATH_DUCUMENT,  // "/Document"
    VBFilePATH_CACHE,     // "/cache
    VBFilePATH_LOG,       // "/cache/Log"
    VBFilePATH_USER,      // "/Document/User"
    VBFilePATH_HTTPCACHE, // "/Document/HttpCache
};

@interface VBFileManager : NSObject
/**
 *  返回需要的文件路径
 *
 *  @param pathType 类型
 *
 *  @return 文件路径
 */
+ (NSString *)getPathWithType:(VBFilePathType)pathType;

/**
 *  文件是否存在
 *
 *  @param filePath 文件路径
 *
 *  @return 是否存在
 */
+ (BOOL)fileIsExit:(NSString *)filePath;

/**
 *  创建文件夹
 *
 *  @param strDir 文件夹路径
 *
 *  @return 是否成功
 */
+ (BOOL)makeDir:(NSString *)strDir;

/**
 *  删除文件
 *
 *  @param filepath 文件夹路径
 *
 *  @return 是否成功
 */
+ (BOOL)deleteFile:(NSString *)filepath;

/**
 *  拷贝文件
 *
 *  @param filePath 文件夹路径
 *
 *  @return 是否成功
 */
+ (BOOL)copyFile:(NSString *)filePath toPath:(NSString *)toPath;

/**
 *   获得文件夹下的所有文件
 *
 *  @param filepath 文件夹路径
 *
 *  @return 所有文件名
 */
+ (NSArray *)findFiles:(NSString *)filepath;

/**
 *  获得文件夹下的所有文件根据扩展名
 *
 *  @param filepath      文件夹路径
 *  @param pathExtension 扩展名
 *
 *  @return 所有文件名
 */
+ (NSArray *)findFiles:(NSString *)filepath pathExtension:(NSString*)pathExtension;

/**
 *  获得文件大小
 *
 *  @param filepath 文件夹路径
 *
 *  @return 大小
 */
+ (NSInteger)getFileSize:(NSString *)filepath;

/**
 *  通过路径获得文件名
 *
 *  @param filepath 文件名
 *
 *  @return 文件名
 */
+ (NSString*)getFileName:(NSString*)filepath;

/**
 *  获得文件扩展名
 *
 *  @param filepath 文件路径
 *
 *  @return 扩展名
 */
+ (NSString*)getFileExtension:(NSString*)filepath;

/**
 *  获得剩余存储空间大小
 *
 *  @return 大小
 */
+ (NSInteger)freeDiskSpaceInBytes;

/**
 *  拷贝文件夹
 *
 *  @param srcPath 原文件夹
 *  @param dstPath 到文件夹
 *
 *  @return 是否成功
 */
+ (BOOL)CopyDir:(NSString *)srcPath toPath:(NSString *)dstPath;

#pragma mark - ZIP
/**
 *  ZIP压缩
 *
 *  @param vecSrcFiles 压缩的文件
 *  @param desFilePath 保存路径
 *
 *  @return 是否成功
 */
+ (BOOL)ZIPCompress:(NSArray *)vecSrcFiles desFilePath:(NSString *)desFilePath;

/**
 *  ZIP解压
 *
 *  @param strSrcFile    解压的文件名
 *  @param strUnZipDir   解压到文件夹下
 *
 *  @return 是否成功
 */
+ (BOOL)ZIPUnCompress:(NSString*)strSrcFile strUnZipDir:(NSString*)strUnZipDir;

/**
 *  ZIP解压
 *
 *  @param strSrcFile    解压的文件名
 *  @param strUnZipDir   解压到文件夹下
 *  @param arrayDesFiles 解压出来的文件名，nil就行 (废弃)
 *  @param bOverWrite    是否写入，YES
 *
 *  @return 是否成功
 */
+ (BOOL)ZIPUnCompress:(NSString*)strSrcFile strUnZipDir:(NSString*)strUnZipDir arrayDesFiles:(NSMutableArray *)arrayDesFiles bOverWrite:(BOOL)bOverWrite;



@end
