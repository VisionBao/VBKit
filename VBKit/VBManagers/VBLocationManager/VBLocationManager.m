//
//  VBLocationManager.m
//  VBKit
//
//  Created by Vision on 15/12/23.
//  Copyright © 2015年 VisionBao. All rights reserved.
//

#import "VBLocationManager.h"
#import <CoreLocation/CLGeocoder.h>
#import <CoreLocation/CLPlacemark.h>

@implementation VBLocationManager
{
    CLLocationManager *_manager;
    CLLocationCoordinate2D _coordinate;
    
    void (^_success)(float,float);
    void (^_failure)();
}

+ (id)shareManager
{
    static id instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{instance = self.new;});
    return instance;
}

- (id)init
{
    if (self = [super init]) {
        _lat = 0.;
        _lot = 0.;
        if([CLLocationManager locationServicesEnabled]){
            //定位功能开启的情况下进行定位
            _manager = [[CLLocationManager alloc] init];
            if ([_manager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
                [_manager requestWhenInUseAuthorization];
            }
            _manager.distanceFilter = kCLDistanceFilterNone;
            _manager.desiredAccuracy = kCLLocationAccuracyBest;
            _manager.delegate = self;
            _isFinishGetLocation = NO;
            [_manager startUpdatingLocation];
        }
    }
    return self;
}

- (BOOL)locationServiceEnabled {
    if (![CLLocationManager locationServicesEnabled]) {
        return NO;
    }
    
    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted:
            return NO;
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
        case kCLAuthorizationStatusAuthorizedAlways:
            return YES;
            break;
        case kCLAuthorizationStatusNotDetermined:
            return YES;
            break;
        default:
            return NO;
            break;
    }
    
    return NO;
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    if (!_isFinishGetLocation) {
        
        //获得当前位置
        _coordinate = newLocation.coordinate;
        _lat = _coordinate.latitude;
        _lot = _coordinate.longitude;
        
        //已经成功获得位置
        _isFinishGetLocation = YES;
        [manager stopUpdatingLocation];
        
        if (_success) {
            _success(_lat,_lot);
            _success = nil;
        }
        
        CLLocation *c = [[CLLocation alloc] initWithLatitude:_lat longitude:_lot];
        //创建位置
        CLGeocoder *revGeo = [[CLGeocoder alloc] init];
        [revGeo reverseGeocodeLocation:c
                     completionHandler:^(NSArray *placemarks, NSError *error) {
                         if (!error && [placemarks count] > 0) {
                             CLPlacemark *placemark = [placemarks objectAtIndex:0];
                             NSDictionary *dict = [placemark addressDictionary];
                             
                             self.locationCityName = [dict objectForKey:@"City"];
                             
                         }
                         else
                         {
                             NSLog(@"ERROR: %@", error); }
                     }];
        
    }
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    [manager stopUpdatingLocation];
    if (_failure) {
        _failure();
        _failure = nil;
    }
}

- (void)updateLocation
{
    _isFinishGetLocation = NO;
    [_manager startUpdatingLocation];
}

- (BOOL)updateLocationWithSuccess:(void (^)(float,float))success
                          failure:(void (^)())failure
{
    _isFinishGetLocation = NO;
    [_manager startUpdatingLocation];
    
    if (_success && _failure) {
        return NO;
    } else {
        _success = [success copy];
        _failure = [failure copy];
    }
    return YES;
}

@end
