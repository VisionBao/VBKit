//
//  VBFMEncryptDatabase.h
//  VBKit
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import <FMDB/FMDB.h>

@interface VBFMEncryptDatabase : FMDatabase


+ (instancetype)databaseWithPath:(NSString*)aPath
                      encryptKey:(NSString *)encryptKey;

- (instancetype)initWithPath:(NSString*)aPath
                  encryptKey:(NSString *)encryptKey;


@end
