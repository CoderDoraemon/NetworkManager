//
//  LDDefine_Device.h
//  LD
//
//  Created by LD on 2016/11/7.
//  Copyright © 2016年 LDSecret. All rights reserved.
//

#ifndef LDDefine_Device_h
#define LDDefine_Device_h


/**
 iPad Air {{0, 0}, {768, 1024}}
 iphone4s {{0, 0}, {320, 480}}     960*640
 iphone5 5s {{0, 0}, {320, 568}}      1136*640
 iphone6 6s {{0, 0}, {375, 667}}     1334*750
 iphone6Plus 6sPlus {{0, 0}, {414, 736}}  1920*1080
 Apple Watch 1.65英寸 320*640
 */

/** 主屏幕的高度 */
#define k_SCREEN_H [[UIScreen mainScreen] bounds].size.height
/** 主屏幕的宽度 */
#define k_SCREEN_W  [[UIScreen mainScreen] bounds].size.width

/** 主屏幕的高度比例 */
#define k_SCREEN_H_SCALE (M_SCREEN_H/640)
/** 主屏幕的宽度比例 */
#define k_SCREEN_W_SCALE (M_SCREEN_W/320)


/** 屏幕的分辨率 当结果为1时，显示的是普通屏幕，结果为2时，显示的是Retian屏幕 */
#define k_SCREEN_SCALE [[UIScreen mainScreen] scale]

/** 除去信号区的屏幕的frame */
#define k_APP_FRAME  [[UIScreen mainScreen] applicationFrame]
/** 应用程序的屏幕高度 */
#define k_APP_FRAME_H   [[UIScreen mainScreen] applicationFrame].size.height
/** 应用程序的屏幕宽度 */
#define k_APP_FRAME_W    [[UIScreen mainScreen] applicationFrame].size.width


/** 系统控件的默认高度 */
#define k_D_STATUS_BAR_H   (20.f)
#define k_D_TOP_BAR_H      (44.f)
#define k_D_STATUS_AND_TOP_BAR_H      (k_D_STATUS_BAR_H + k_D_TOP_BAR_H)
#define k_D_BOTTOM_BAR_H   (49.f)
#define k_D_CELL_H (44.f)

/** 中英状态下键盘的高度 */
#define k_ENG_KEY_BOARD_H  (216.f)
#define k_CHN_KEY_BOARD_H  (252.f)


#define k_IS_IOS6 (k_SYSTEM_VERSION_FloatValue >= 6.0 && k_SYSTEM_VERSION_FloatValue < 7)
#define k_IS_IOS7 (k_SYSTEM_VERSION_FloatValue >= 7.0 && k_SYSTEM_VERSION_FloatValue < 8.0)
#define k_IS_IOS8 (k_SYSTEM_VERSION_FloatValue >= 8.0 && k_SYSTEM_VERSION_FloatValue < 9.0)
#define k_IS_IOS9 (k_SYSTEM_VERSION_FloatValue >= 9.0 && k_SYSTEM_VERSION_FloatValue < 10.0)

/** 设备判断 */
#define k_IS_IPHONE [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define k_IS_PAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/** iPhone的型号 */
#define k_IS_IPHONE4 ([[UIScreen mainScreen] bounds].size.height == 480)
#define k_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)
#define k_IS_IPHONE6 ([[UIScreen mainScreen] bounds].size.height == 667)
#define k_IS_IPHONE6_PLUS ([[UIScreen mainScreen] bounds].size.height == 736)

/** 系统的版本号 */
#define k_SYSTEM_VERSION_FloatValue [[[UIDevice currentDevice] systemVersion] floatValue]
#define k_SYSTEM_UUID [[DeviceHelper sharedDeviceHelper] getDeiveUUID]
#define k_SYSTEM_MODEL [[DeviceHelper sharedDeviceHelper] getDeiveModel]
#define k_SYSTEM_VERSION [[DeviceHelper sharedDeviceHelper] getDeiveVersion]

/** APP版本号 */
#define k_APP_VERSION  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/** APP BUILD 版本号 */
#define k_APP_BUILD_VERSION  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/** APP名字 */
#define k_APP_DISPLAY_NAME  [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]

/** 当前语言 */
#define k_LOCAL_LANGUAGE [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode]

/** 当前国家 */
#define k_LOCAL_COUNTRY [[NSLocale currentLocale] objectForKey:NSLocaleCountrLDode]


/** 判断设备室真机还是模拟器 */
#if TARGET_OS_IPHONE
#endif

#if TARGET_IPHONE_SIMULATOR
#endif


#endif /* LDDefine_Device_h */
