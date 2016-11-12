//
//  VBDBManager.h
//  VBKit
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "fmdb.h"

#define ARRAYSIZE(A) (sizeof(A)/sizeof((A)[0]))


/**
 *  数据库管理基类
 */
@interface VBDBManager : NSObject{
    FMDatabaseQueue *_dbQueue;
}

+ (id)shareManager;
- (FMDatabaseQueue *)fmDabaseQueue;

@end
