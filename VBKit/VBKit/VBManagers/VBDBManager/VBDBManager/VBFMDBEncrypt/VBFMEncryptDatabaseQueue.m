//
//  VBFMEncryptDatabaseQueue.m
//  VBMusic
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import "VBFMEncryptDatabaseQueue.h"
#import "VBFMEncryptDatabase.h"

@implementation VBFMEncryptDatabaseQueue

+ (Class)databaseClass
{
    return [VBFMEncryptDatabase class];
}

@end
