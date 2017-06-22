//
//  FMAlertTool.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMAlertTool : NSObject

+ (void)alertTitle:(NSString *)titile type:(UIAlertControllerStyle)alertType message:(NSString *)message didTask:(void(^)())task;

@end
