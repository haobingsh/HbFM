//
//  FMCacheTool.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMCacheTool : NSObject

+ (NSString *)getSizeWithPath: (NSString *)path;

+ (void)clearCacheWithPath: (NSString *)path;

@end
