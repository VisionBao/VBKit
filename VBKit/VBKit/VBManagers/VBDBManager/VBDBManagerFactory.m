//
//  VBDBManagerFactory.m
//  VBKit
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import "VBDBManagerFactory.h"

@implementation VBDBManagerFactory

+(id)sharedInstance {
    static VBDBManagerFactory *s_factory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_factory = [[VBDBManagerFactory alloc] init];
    });
    return s_factory;
}


@end
