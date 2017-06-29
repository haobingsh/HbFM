//
//  FileTool.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/28.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileTool : NSObject

+ (long long int)getFileSizeWithPath: (NSString *)filePath;

+ (void)removeFileAtPath: (NSString*)filePath;

+ (float)calculateFileSizeInUnit:(unsigned long long)contentLength;

+ (NSString *)calculateUnit:(unsigned long long)contentLength;

@end
