//
//  FMAlertTool.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "FMAlertTool.h"

@implementation FMAlertTool

+ (void)alertTitle:(NSString *)titile type:(UIAlertControllerStyle)alertType message:(NSString *)message didTask:(void(^)())task {
    
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:titile message:message preferredStyle:alertType];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (task) {
            task();
        }
    }];
    
    [alertVC addAction:action];
    [alertVC addAction:action1];
    
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertVC animated:YES completion:nil];
}

@end
