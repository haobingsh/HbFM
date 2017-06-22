//
//  FMNoticeLocal.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMNoticeLocal : NSObject

+(UILocalNotification*)RegisterLocalNotificationWithFireDate:(NSDate *)firedate //后台运行的本地通知
                                                  repeatType:(NSCalendarUnit)repeatInterval
                                                   keepSleep:(BOOL)isKeepSleep;




+(void)cancelAllLocalNotifications;
+(void)cancelKeepSleepNotice;
+(void)cancleAlarmNotifications;

@end
