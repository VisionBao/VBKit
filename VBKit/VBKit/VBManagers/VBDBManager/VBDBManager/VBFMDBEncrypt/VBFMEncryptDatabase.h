//
//  VBFMEncryptDatabase.h
//  VBMusic
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import <FMDB/FMDB.h>

@interface VBFMEncryptDatabase : FMDatabase

/** 如果需要自定义encryptkey，可以调用这个方法修改（在使用之前）*/
+ (void)setEncryptKey:(NSString *)encryptKey;

@end
