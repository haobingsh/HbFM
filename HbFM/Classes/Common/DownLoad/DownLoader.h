//
//  DownLoader.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/28.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownLoader : NSObject

@property (nonatomic, strong, readonly) NSURL *downLoadURL;

/**
 用于记录是否正在下载
 */
@property (nonatomic, assign, readonly) BOOL isDowning;

/**
 当前下载任务的进度
 */
@property (nonatomic, assign, readonly) float progress;

- (void)downLoadWithURL:(NSURL *)url withProgressBlock: (void(^)(float progress)) progress success: (void(^)(NSString *downLoadPath)) success failed:(void(^)()) fail;

- (void)pauseDownLoad;
- (void)resumeDownLoad;
- (void)cancelDownLoad;

+ (long long int)cacheFileSizeWithURL:(NSURL *)url;
+ (void)removeCacheFileWithURL:(NSURL *)url;

@end
