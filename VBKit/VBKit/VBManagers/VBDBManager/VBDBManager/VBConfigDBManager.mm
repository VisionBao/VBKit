//
//  VBConfigDBManager.m
//  VBKit
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import "VBConfigDBManager.h"

@implementation VBConfigDBManager
+ (id)sharedManager {
    static VBConfigDBManager *s_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance = [[VBConfigDBManager alloc] init];
    });
    return s_instance;
}

- (id)init {
    self = [super init];
    if (self) {
        _dbMgr = [VBDBManager defaultMgr];
        // 一定要先获取 dbMgr才能调用
        [self createTables];
    }
    return self;
}

- (void)createTables {
    [[_dbMgr fmDabaseQueue] inDatabase:^(FMDatabase *db) {
        const char *table_sql[] = {
            "CREATE TABLE IF NOT EXISTS config ("
            "key        VARCHAR(256) PRIMARY KEY,"
            "value      VARCHAR(1024)"
            ")"
        };
        BOOL retValue = NO;
        for (int i = 0; i < ARRAYSIZE(table_sql); i ++) {
            retValue = [db executeUpdate:[NSString stringWithUTF8String:table_sql[i]]];
            if (!retValue) {
                NSLog(@"execute sql error.");
                break;
            }
        }
    }];
}

- (void)clearTables {
    [[_dbMgr fmDabaseQueue] inDatabase:^(FMDatabase *db) {
        const char *table_sql[] = {
            "DELETE FROM config"
        };
        BOOL retValue = NO;
        for (int i = 0; i < ARRAYSIZE(table_sql); i ++) {
            retValue = [db executeUpdate:[NSString stringWithUTF8String:table_sql[i]]];
            if (!retValue) {
                NSLog(@"execute sql error.");
                break;
            }
        }
    }];
}

- (void)dropTables {
    [[_dbMgr fmDabaseQueue] inDatabase:^(FMDatabase *db) {
        const char *table_sql[] = {
            "DROP TABLE config"
        };
        BOOL retValue = NO;
        for (int i = 0; i < ARRAYSIZE(table_sql); i ++) {
            retValue = [db executeUpdate:[NSString stringWithUTF8String:table_sql[i]]];
            if (!retValue) {
                NSLog(@"execute sql error.");
                break;
            }
        }
    }];
}

- (BOOL)insertItem:(NSString *)key value:(NSString *)value {
    assert(key && [key length] > 0);
    __block BOOL retValue = NO;
    [[_dbMgr fmDabaseQueue] inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:@"SELECT value FROM config WHERE key = ?", key];
        if ([rs next]) {
            retValue = [db executeUpdate:@"UPDATE config SET value = ? WHERE key = ?", value, key];
        } else {
            retValue = [db executeUpdate:@"INSERT INTO config (key, value) VALUES (?,?)", key, value];
        }
        [rs close];
    }];
    
    return retValue;
}

- (BOOL)insertBoolItem:(NSString *)key value:(BOOL)value {
    return [self insertItem:key value:(value ? @"1" : @"0")];
}

- (BOOL)insertIntItem:(NSString *)key value:(NSInteger)value {
    return [self insertItem:key value:[NSString stringWithFormat:@"%ld", (long)value]];
}

- (NSString *)queryItem:(NSString *)key {
    assert(key && [key length] > 0);
    __block NSString *retValue = @"";
    [[_dbMgr fmDabaseQueue] inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:@"SELECT value FROM config WHERE key = ?", key];
        if ([rs next]) {
            if (![rs columnIsNull:@"value"]) {
                retValue = [NSString stringWithString:[rs stringForColumn:@"value"]];
            }
        }
        [rs close];
    }];
    
    return retValue;
}

- (BOOL)updateItem:(NSString *)key value:(NSString *)value {
    __block BOOL retValue = NO;
    [[_dbMgr fmDabaseQueue] inDatabase:^(FMDatabase *db) {
        retValue = [db executeUpdate:@"UPDATE config SET value = ? WHERE key = ?", value, key];
    }];
    
    return retValue;
}

- (BOOL)deleteItem:(NSString *)key {
    __block BOOL retValue = NO;
    [[_dbMgr fmDabaseQueue] inDatabase:^(FMDatabase *db) {
        retValue = [db executeUpdate:@"DELETE FROM config WHERE key = ?", key];
    }];
    
    return retValue;
}

@end
