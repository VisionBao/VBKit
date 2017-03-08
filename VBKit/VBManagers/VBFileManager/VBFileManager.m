//
//  VBFileManager.m
//  VBKit
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import "VBFileManager.h"
#include <sys/param.h>
#include <sys/mount.h>
#import "ZipArchive.h"


@implementation VBFileManager
+ (NSString *)getPathWithType:(VBFilePathType)pathType {
    NSString * strpath;
    switch (pathType) {
        case VBFilePATH_HOME:
            strpath = NSHomeDirectory();
            break;
        case VBFilePATH_APP:
            strpath = [[NSBundle mainBundle] resourcePath];
            break;
        case VBFilePATH_LIBRARY:
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
            strpath = [paths objectAtIndex:0];
        }
            break;
        case VBFilePATH_DUCUMENT:
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            strpath = [paths objectAtIndex:0];
        }
            break;
        case VBFilePATH_CACHE:
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            strpath = [paths objectAtIndex:0];
        }
            break;
        case VBFilePATH_LOG:
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            strpath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Log"];
            [VBFileManager makeDir:strpath];
        }
            break;
        
        case VBFilePATH_USER:
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            strpath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"User"];
            [VBFileManager makeDir:strpath];
        }
            break;
        case VBFilePATH_HTTPCACHE:
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            strpath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"HttpCache"];
            [VBFileManager makeDir:strpath];
        }
            break;
        default:
            break;
    }
    
    [VBFileManager addSkipBackupAttributeToItemAtURL:strpath];
    return  strpath;
}

+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSString *)filePath
{
    NSURL *URL = [NSURL fileURLWithPath:filePath];
    
    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
    
    NSError *error = nil;
    BOOL success = [URL setResourceValue: [NSNumber numberWithBool: YES]
                                  forKey: NSURLIsExcludedFromBackupKey error: &error];
    if(!success){
        NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }
    return success;
}

+ (BOOL)fileIsExit:(NSString *)filePath {
    if (filePath.length == 0) {
        return NO;
    }
    
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

+ (BOOL)makeDir:(NSString *)strDir {
    if(strDir.length == 0) {
        return NO;
    }
    
    if([VBFileManager fileIsExit:strDir]) {
        return YES;
    }
    
    return [[NSFileManager defaultManager] createDirectoryAtPath:strDir withIntermediateDirectories:YES attributes:nil error:nil];
}

+ (BOOL)deleteFile:(NSString *)filepath {
    if (!filepath || [filepath length]==0) {
        return NO;
    }
    if (![VBFileManager fileIsExit:filepath]) {
        return YES;
    }
    NSError* err;
    return ([[NSFileManager defaultManager] removeItemAtPath:filepath error:&err]);
}

+ (BOOL)copyFile:(NSString *)filePath toPath:(NSString *)toPath {
    NSError* err;
    return [[NSFileManager defaultManager] copyItemAtPath:filePath toPath:toPath error:&err];
}

+ (NSArray *)findFiles:(NSString *)filepath {
    if (![VBFileManager fileIsExit:filepath]) {
        return nil;
    }
    NSFileManager* pMgr=[NSFileManager defaultManager];
    return [pMgr contentsOfDirectoryAtPath:filepath error:nil];
}

+ (NSArray *)findFiles:(NSString *)filepath pathExtension:(NSString*)pathExtension {
    if (![VBFileManager fileIsExit:filepath]) {
        return nil;
    }
    NSFileManager* pMgr=[NSFileManager defaultManager];
    NSArray* array=[pMgr contentsOfDirectoryAtPath:filepath error:nil];
    
    NSMutableArray *arrayFiles = [[NSMutableArray alloc] init];
    
    for (NSString* file in array) {
        if ([[file pathExtension] isEqualToString:pathExtension]) {
            [arrayFiles addObject:[filepath stringByAppendingPathComponent:file]];
        }
    }
    
    return arrayFiles;
}

+ (NSInteger)getFileSize:(NSString *)filepath {
    if ([filepath length]==0) {
        return 0;
    }
    NSFileManager* fileMgr = [NSFileManager defaultManager];
    BOOL isDirectory;
    if (![fileMgr fileExistsAtPath:filepath isDirectory:&isDirectory] || isDirectory) {
        return 0;
    }
    NSDictionary* attrs = [fileMgr attributesOfItemAtPath:filepath error:nil];
    if (!attrs) {
        return 0;
    }
    NSNumber* size = [attrs objectForKey:NSFileSize];
    if (!size) {
        return 0;
    }
    return [size integerValue];
}

+ (NSString*)getFileName:(NSString*)filepath {
    if (!filepath || [filepath length]==0) {
        return nil;
    }
    return [filepath lastPathComponent];
}

+ (NSString*)getFileExtension:(NSString*)filepath {
    return [filepath pathExtension];
}

+ (NSInteger)freeDiskSpaceInBytes
{
    struct statfs buf;
    long long freespace = -1;
    if (statfs("/var", &buf) >= 0) {
        freespace = (long long)(buf.f_bsize * buf.f_bfree);
    }
    return (NSInteger)(freespace/1024/1024);
}

+ (BOOL)CopyDir:(NSString *)srcPath toPath:(NSString *)dstPath {
    if (!srcPath || !dstPath || [srcPath length]==0 || [dstPath length]==0) {
        return FALSE;
    }
    NSFileManager* fileMgr = [NSFileManager defaultManager];
    NSError * err;
    BOOL bret = false;
    NSArray *filearr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:srcPath error:&err];
    if(filearr != nil)
    {
        if(![VBFileManager fileIsExit:dstPath])
            [VBFileManager makeDir:dstPath];
        for(NSString * strname in filearr)
        {
            NSString *srcfilepath = [srcPath stringByAppendingPathComponent:strname];
            NSString * dstfilepath = [dstPath stringByAppendingPathComponent:strname];
            bret = [fileMgr copyItemAtPath:srcfilepath toPath:dstfilepath error:&err];
            if(!bret)
                break;
        }
    }
    return bret;
}

#pragma mark - ZIP
+ (BOOL)ZIPCompress:(NSArray *)vecSrcFiles desFilePath:(NSString *)desFilePath {
    ZipArchive* zip=[[ZipArchive alloc] init];
    BOOL ret=[zip CreateZipFile2:desFilePath];
    
    if (!ret) {
        return NO;
    }
    
    for (NSString* file in vecSrcFiles) {
        NSString* strFileName = [VBFileManager getFileName:file];
        ret=[zip addFileToZip:file newname:strFileName];
        if (!ret) {
            return NO;
        }
    }
    ret = [zip CloseZipFile2];
    return ret;
}

+ (BOOL)ZIPUnCompress:(NSString*)strSrcFile strUnZipDir:(NSString*)strUnZipDir {
    return [VBFileManager ZIPUnCompress:strSrcFile strUnZipDir:strUnZipDir arrayDesFiles:nil bOverWrite:YES];
}

+ (BOOL)ZIPUnCompress:(NSString*)strSrcFile strUnZipDir:(NSString*)strUnZipDir arrayDesFiles:(NSMutableArray *)arrayDesFiles bOverWrite:(BOOL)bOverWrite {
    if (arrayDesFiles) {
        [arrayDesFiles removeAllObjects];
    }
    ZipArchive* zip=[[ZipArchive alloc] init];
    BOOL ret=[zip UnzipOpenFile:strSrcFile];
    if (!ret) {
        return FALSE;
    }
    ret = [zip UnzipFileTo:strUnZipDir overWrite:bOverWrite];
//    ret=[zip UnzipFileTo:strUnZipDir overWrite:bOverWrite filepaths:arrayDesFiles];
    
    return ret;
}

@end
