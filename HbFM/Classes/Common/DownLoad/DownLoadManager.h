//
//  DownLoadManager.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/28.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownLoader.h"

@interface DownLoadManager : NSObject

+ (instancetype)shareInstance;

- (DownLoader *)loaderWithURL:(NSURL *)url;

- (void)downLoadWithURL:(NSURL *)url progressBlock:(void(^)(float progress))progressBlock successBlock:(void(^)(NSString *fileFullPath))successBlock failBlock:(void(^)())failBlock;

- (void)pauseDownLoadWithURL:(NSURL *)url;

- (void)resumeDownLoadWithURL:(NSURL *)url;

- (void)cancelDownLoadWithURL:(NSURL *)url;


@end
