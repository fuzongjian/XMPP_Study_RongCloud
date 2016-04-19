//
//  DeviceInfo.h
//  XMPP_Study_RongCloud
//
//  Created by 陈舒澳 on 16/4/19.
//  Copyright © 2016年 speeda. All rights reserved.
//

#ifndef DeviceInfo_h
#define DeviceInfo_h

#define iPHone6Plus ([UIScreen mainScreen].bounds.size.height == 736) ? YES : NO

#define iPHone6 ([UIScreen mainScreen].bounds.size.height == 667) ? YES : NO

#define iPHone5 ([UIScreen mainScreen].bounds.size.height == 568) ? YES : NO

#define iPHone4oriPHone4s ([UIScreen mainScreen].bounds.size.height == 480) ? YES : NO

/**
 *  屏幕宽
 */
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

/**
 *  屏幕高
 */
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
/**
 *  用户设备的版本号
 */

#define IOSVERSION  [[[UIDevice currentDevice] systemVersion] floatValue]



#endif /* DeviceInfo_h */
