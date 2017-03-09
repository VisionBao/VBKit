//
//  VBConfigDBManager.h
//  VBKit
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBDBManager.h"

@interface VBConfigDBManager : NSObject{
    VBDBManager *_dbMgr;
}

+ (id)shareManager;
- (void)clearTables;
- (void)dropTables;
- (BOOL)insertItem:(NSString *)key value:(NSString *)value;
- (BOOL)insertBoolItem:(NSString *)key value:(BOOL)value;
- (BOOL)insertIntItem:(NSString *)key value:(NSInteger)value;
- (NSString *)queryItem:(NSString *)key;
- (BOOL)updateItem:(NSString *)key value:(NSString *)value;
- (BOOL)deleteItem:(NSString *)key;
@end
