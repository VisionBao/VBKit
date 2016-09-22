//
//  ZZConstants.h
//  ZZVideoDiagnose
//
//  Created by Vision on 16/9/12.
//  Copyright © 2016年 ZhiZhen. All rights reserved.
//

#ifndef ZZConstants_h
#define ZZConstants_h

// 设备的高和宽
#define     SCREEN_WIDTH    ([[UIScreen mainScreen] bounds].size.width)
#define     SCREEN_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)
#define     SCREEN_SCALE    [[UIScreen mainScreen] scale]

#define     SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define     SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define     STATUS_BAR_HEIGHT  20 //([UIApplication sharedApplication].statusBarFrame.size.height)

// 所有的导航栏的高度, 这是把状态栏算在内的
#define     NAVIGATION_BAR_HEIGHT   (44.0f + STATUS_BAR_HEIGHT)

typedef NS_ENUM(NSUInteger, ZZProfessionType) {
    ZZPatient,          //患者
    ZZDoctor,           //基地医生
    ZZSpecialist,       //专家
};

//账号，密码（患者，医生，专家）
#define ZZPATIENTNAME        @"patien"
#define ZZPATIENTPASSWORD    @"123456"
#define ZZDOCTORNAME         @"docto"
#define ZZDOCTORPASSWORD     @"123456"
#define ZZSPECIALISTNAME     @"specialis"
#define ZZSPECIALISTPASSWORD @"123456"
#define ZHIZHEN1NAME             @"zhizhen1"
#define ZHIZHEN1PASSWORD         @"123456"
#define ZHIZHEN2NAME             @"zhizhen2"
#define ZHIZHEN2PASSWORD         @"123456"

//会议室房间ID
#define ZZMeetingName        @"ZZMeetingName"
#define ZZUserDefault         ([NSUserDefaults standardUserDefaults])


#endif /* ZZConstants_h */
