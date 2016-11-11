//
//  VBLocationManager.h
//  VBKit
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

/*使用时添加CoreLocation框架*/
#import <Foundation/Foundation.h>
#import "CoreLocation/CLLocationManagerDelegate.h"

@interface VBLocationManager : NSObject<CLLocationManagerDelegate>

+ (id)sharedInstance;

- (BOOL)locationServiceEnabled;
- (void)updateLocation;
- (BOOL)updateLocationWithSuccess:(void (^)(float,float))success
                          failure:(void (^)())failure;

@property (assign, nonatomic) float lat;
@property (assign, nonatomic) float lot;
@property (strong, nonatomic) NSString *locationCityName;
@property (assign, nonatomic) BOOL isFinishGetLocation;

@end
