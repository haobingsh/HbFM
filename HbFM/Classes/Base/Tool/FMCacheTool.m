//
//  FMCacheTool.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "FMCacheTool.h"

@implementation FMCacheTool

+ (void)clearCacheWithPath: (NSString *)path {
    
    NSFileManager *manager = [NSFileManager defaultManager];
    [manager removeItemAtPath:path error:nil];
    
}

+ (NSString *)getSizeWithPath: (NSString *)path {
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    float totalSize = 0;
    BOOL isDirectory = NO;
    if(![manager fileExistsAtPath:path isDirectory:&isDirectory]) {
        return @"";
    }else if (!isDirectory)
    {
        totalSize = [manager attributesOfItemAtPath:path error:nil].fileSize;
    }else {
        //    NSArray *paths = [manager contentsOfDirectoryAtPath:path error:nil];
        NSArray *subPaths = [manager subpathsAtPath:path];
        //    XMGLog(@"%@", subPaths);
        
        
        for(NSString *subPath in subPaths) {
            
            NSDictionary *dic = [manager attributesOfItemAtPath:[path stringByAppendingPathComponent:subPath] error:nil];
            
            if (dic.fileType == NSFileTypeRegular) {
                totalSize += dic.fileSize;
            }
            
            
        }
        
    }
    
    
    // 处理单位
    NSArray *units = @[@"B", @"KB", @"MB", @"GB", @"TB"];
    NSInteger count = 1000;
    NSInteger index = 0;
    while (totalSize > count) {
        totalSize = totalSize / count;
        index ++;
    }
    
    NSString *formatStr = [NSString stringWithFormat:@"%.1f%@", totalSize, units[index]];
    
    return formatStr;
    
}


@end
