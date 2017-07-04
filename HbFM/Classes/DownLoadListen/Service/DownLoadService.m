//
//  DownLoadService.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "DownLoadService.h"
#import "DownLoadDataTool.h"
#import "Sington.h"
#import "DownLoadManager.h"

@interface DownLoadService()


@end

@implementation DownLoadService

singtonImplement(DownLoadService);


+ (void)downLoadVoiceM:(DownLoadVoiceModel *)downLoadVoiceM {
    
    // 1. 创建本地缓存, 记录已经下载的数据记录
    [[DownLoadDataTool shareInstance] saveDownLoadVoiceModel:downLoadVoiceM];
    
    
    // 2. 执行下载操作
    [[DownLoadManager shareInstance] downLoadWithURL:[NSURL URLWithString:downLoadVoiceM.downloadUrl] progressBlock:^(float progress) {
        NSLog(@"progress--%f", progress);
        
    } successBlock:^(NSString *fileFullPath) {
        NSLog(@"path - %@", fileFullPath);
        [[DownLoadDataTool shareInstance] setVoiceMDownLoaded:YES withURL:downLoadVoiceM.downloadUrl];
        
        // 当下载状态发生变化时, 告知外界, 外界可以更新显示列表
        [[NSNotificationCenter defaultCenter] postNotificationName:kDownLoadStateChangeNotification object:nil];
        
    } failBlock:^{
        NSLog(@"下载失败");
    }];
    
    
    
    
}

+ (void)pauseVoiceM:(DownLoadVoiceModel *)downLoadVoiceM {
    
    [[DownLoadManager shareInstance] pauseDownLoadWithURL:[NSURL URLWithString:downLoadVoiceM.downloadUrl]];
    
}

+ (void)stopVoiceM:(DownLoadVoiceModel *)downLoadVoiceM
{
    
    [[DownLoadManager shareInstance] cancelDownLoadWithURL:[NSURL URLWithString:downLoadVoiceM.downloadUrl]];
    
}


+ (BOOL)isExsists:(NSString *)filePath {
    
    //    TYDownloadSessionManager *manager = [TYDownloadSessionManager manager];
    //
    //    // 查找对应的下载模型
    //    TYDownloadModel *model = [manager downLoadingModelForURLString:filePath];
    //
    //    return [manager isDownloadCompletedWithDownloadModel:model];
    
    return YES;
}


@end
