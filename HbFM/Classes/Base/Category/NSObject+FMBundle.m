//
//  NSObject+FMBundle.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "NSObject+FMBundle.h"

@implementation NSObject (FMBundle)

+ (NSBundle *)currentBundle {
    
    NSBundle *bundle = [NSBundle bundleForClass:self];
    return bundle;
    //    if (_currentBundle == nil) {
    //        NSArray *frames = [NSBundle allFrameworks];
    //        for (NSBundle *bundle in frames) {
    //            NSString *bundleName = bundle.bundleURL.lastPathComponent;
    //            if ([bundleName containsString:@"DiscoverModule"]) {
    //                _currentBundle = bundle;
    //                break;
    //            }
    //        }
    //    }
    //    if (_currentBundle == nil) {
    //        return [NSBundle mainBundle];
    //    }
    //    return _currentBundle;
}


@end
