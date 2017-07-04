//
//  DownLoadAlbumModel.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "DownLoadAlbumModel.h"
#import "FileTool.h"

@implementation DownLoadAlbumModel


-(NSString *)fileFormatSize
{
    
    float downloadSize = 0;
    for (DownLoadVoiceModel *voiceM in self.voiceMs) {
        downloadSize += voiceM.downloadSize;
    }
    
    float size = [FileTool calculateFileSizeInUnit:downloadSize];
    NSString *unit = [FileTool calculateUnit:downloadSize];
    return [NSString stringWithFormat:@"%.1f %@", size, unit];
}

-(NSMutableArray<DownLoadVoiceModel *> *)voiceMs
{
    if (_voiceMs == nil) {
        _voiceMs = [NSMutableArray array];
    }
    return _voiceMs;
}

@end
