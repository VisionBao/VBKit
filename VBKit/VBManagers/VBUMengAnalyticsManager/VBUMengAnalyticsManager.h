//
//  VBUMengAnalyticsManager.h
//  VBBaseExample
//
//  Created by Vision on 2017/3/7.
//  Copyright © 2017年 VisionBao. All rights reserved.
//

/*统一一处管理埋点
 使用时:请添加名称为VBUserAnalyticsConfig格式为plist的文件
        root设置为Dictionary类型并添加下面字段以实现功能:
 --------------------------------------------------------
        ActionEnabled    =  (Boolean类型)   action触发开关
        PageEnterEnabled =  (Boolean类型)   进入页面触发开关
        PageLeaveEnabled =  (Boolean类型)   离开页面触发开关
 --------------------------------------------------------
        若想在某个页面埋点,添加如下格式:
        e.g.
        ViewController =     {          <-----需要埋点类名         (Dictionary类型)
            ControlEventIDs =         { <-----Action埋点 *key固定 (Dictionary类型)
                "touchAction:" = ccc;   <-----埋点方法名           (String类型)
            };
            PageEventIDs =         {    <-----页面埋点    *key固定 (Dictionary类型)
                Enter = aaa;            <-----进入页面埋点 *key固定 (String类型)
                Leave = bbb;            <-----离开页面埋点 *key固定 (String类型)
            };
        };
 --------------------------------------------------------
 完整示例:
 {
    ActionEnabled    = 0;
    PageEnterEnabled = 0;
    PageLeaveEnabled = 0;
    AViewController =     {
        ControlEventIDs =         {
            "atouchAction:" = ccc;
            "btouchAcinon:" = ddd
        };
        PageEventIDs =         {
            Enter = aaa;
            Leave = bbb;
        };
    };
    BViewController =     {
        ControlEventIDs =         {
            "ctouchAction:" = eee;
        };
        PageEventIDs =         {
            Enter = fff;
            Leave = ddd;
        };
    };
 }
 --------------------------------------------------------
*/

#import <Foundation/Foundation.h>

@interface VBUMengAnalyticsManager : NSObject
/**
 配置友盟统计appkey
 请在appdelegate中 application:didFinishLaunchingWithOptions:调用此方法
 
 @param appkey appkey
 */
+ (void)configAppkey:(NSString *)appkey;

/**
 统计事件

 @param eventId 事件ID
 */
+ (void)event:(NSString *)eventId;

@end
