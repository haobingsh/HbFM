//
//  DownLoadVoiceModel.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "DownLoadVoiceModel.h"
#import "FileTool.h"
#import "DownLoadManager.h"

@implementation DownLoadVoiceModel

- (float)downLoadProgress {
    float progress = [[DownLoadManager shareInstance] loaderWithURL:[NSURL URLWithString:self.downloadUrl]].progress;
    if (progress == 0.0) {
        progress = 1.0 * [DownLoader cacheFileSizeWithURL:[NSURL URLWithString:self.downloadUrl]] / self.downloadSize;
    }
    return progress;
}

- (BOOL)isDownLoading {
    return  [[DownLoadManager shareInstance] loaderWithURL:[NSURL URLWithString:self.downloadUrl]].isDowning;
}


-(NSString *)fileFormatSize
{
    float size = [FileTool calculateFileSizeInUnit:self.downloadSize];
    NSString *unit = [FileTool calculateUnit:self.downloadSize];
    return [NSString stringWithFormat:@"%.1f %@", size, unit];
    
}

-(NSString *)downLoadFormatSize
{
    float size = [FileTool calculateFileSizeInUnit:self.downloadSize * self.downLoadProgress];
    NSString *unit = [FileTool calculateUnit:self.downloadSize * self.downLoadProgress];
    return [NSString stringWithFormat:@"%.1f %@", size, unit];
}


@end
