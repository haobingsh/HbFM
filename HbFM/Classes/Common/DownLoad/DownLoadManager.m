//
//  DownLoadManager.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/28.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "DownLoadManager.h"

@interface DownLoadManager()

@property (nonatomic, strong) NSMutableDictionary *downLoadDic;

@end

@implementation DownLoadManager

static DownLoadManager *_shareInstance;

+ (instancetype)shareInstance {
    
    if(_shareInstance == nil) {
        _shareInstance = [[DownLoadManager alloc] init];
    }
    return _shareInstance;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [super allocWithZone:zone];
    });
    
    return _shareInstance;
    
}

- (NSMutableDictionary *)downLoadDic {
    if (!_downLoadDic) {
        _downLoadDic = [NSMutableDictionary dictionary];
    }
    return _downLoadDic;
}

- (DownLoader *)loaderWithURL:(NSURL *)url {
    return self.downLoadDic[url.lastPathComponent];
}

- (void)downLoadWithURL:(NSURL *)url progressBlock:(void(^)(float progress))progressBlock successBlock:(void(^)(NSString *fileFullPath))successBlock failBlock:(void(^)())failBlock {
    
    DownLoader *downLoader = [self loaderWithURL:url];
    __weak DownLoadManager *weakManager = self;
    if (!downLoader) {
        downLoader = [[DownLoader alloc] init];
        [self.downLoadDic setValue:downLoader forKey:url.lastPathComponent];
        [downLoader downLoadWithURL:url withProgressBlock:^(float progress) {
            progressBlock(progress);
        } success:^(NSString *downLoadPath) {
            successBlock(downLoadPath);
            // 移除对象
            [weakManager.downLoadDic removeObjectForKey:downLoadPath.lastPathComponent];
        } failed:^{
            failBlock();
        }];
        
    }else {
        [downLoader resumeDownLoad];
    }
    
    
}

- (void)pauseDownLoadWithURL:(NSURL *)url {
    DownLoader *downLoader = [self loaderWithURL:url];
    [downLoader pauseDownLoad];
}

- (void)resumeDownLoadWithURL:(NSURL *)url {
    DownLoader *downLoader = [self loaderWithURL:url];
    [downLoader resumeDownLoad];
}

- (void)cancelDownLoadWithURL:(NSURL *)url {
    DownLoader *downLoader = self.downLoadDic[url.lastPathComponent];
    if (downLoader) {
        [downLoader cancelDownLoad];
    }else {
        [DownLoader removeCacheFileWithURL:url];
    }
    
}

@end
