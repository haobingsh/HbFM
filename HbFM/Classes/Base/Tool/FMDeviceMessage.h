//
//  FMDeviceMessage.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMDeviceMessage : NSObject

/**
 *  设备剩余存储空间
 *
 *  @return 剩余存储空间
 */
+ (NSString *)freeDiskSpaceInBytes;

@end
