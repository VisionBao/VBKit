//
//  VBConfigDBManager.h
//  VBMusic
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VBDBManager.h"

@interface VBConfigDBManager : NSObject{
    VBDBManager *_dbMgr;
}

+ (id)sharedManager;
@end
