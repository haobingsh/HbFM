//
//  SetValueTool.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "SetValueTool.h"
#import "DownLoadVoiceModel.h"
#import "DownLoadAlbumModel.h"

#import "DownLoadVoiceCell.h"
#import "DownLoadAlbumCell.h"
#import "TodayFireVoiceCell.h"

#import "DownLoadDataTool.h"

#import "DownLoadService.h"
#import "UIButton+WebCache.h"
#import "UIImageView+FMExtension.h"
#import "PlayerService.h"

@implementation SetValueTool

+ (id)setModel: (id)model toCell:(UITableViewCell *)cell {
    
    
    // 下载声音模型
    if ([model isKindOfClass:[DownLoadVoiceModel class]]) {
        DownLoadVoiceModel *modelR = (DownLoadVoiceModel *)model;
        
        if ([cell isKindOfClass:[DownLoadVoiceCell class]]) {
            DownLoadVoiceCell *cellR = (DownLoadVoiceCell *)cell;
            
            cellR.clickBlock = modelR.clickBlock;
            cellR.downLoadBlock = modelR.downLoadBlock;
            cellR.deleteBlock = modelR.deleteBlock;
            cellR.trackID = modelR.trackId;
            
            
            // 赋值
            [cellR.playOrPauseBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:modelR.coverSmall]  forState:UIControlStateNormal];
            
            cellR.voiceTitleLabel.text = modelR.title;
            cellR.voiceAuthorLabel.text = [NSString stringWithFormat:@"by %@", modelR.nickname];
            [cellR.voicePlayCountBtn setTitle:[NSString stringWithFormat:@"%zd", modelR.playtimes] forState:UIControlStateNormal];
            [cellR.voiceCommentBtn setTitle:[NSString stringWithFormat:@"%zd", modelR.comments] forState:UIControlStateNormal];
            [cellR.voiceDurationBtn setTitle:[NSString stringWithFormat:@"%zd", modelR.duration] forState:UIControlStateNormal];
            
            cellR.voiceFileSizeLabel.text = modelR.fileFormatSize;
            cellR.voicePlayProgressLabel.text = @"";
            
            
            cellR.downLoadProgressV.progress = modelR.downLoadProgress;
            cellR.progressLabel.text = [NSString stringWithFormat:@"%@/%@", modelR.downLoadFormatSize , modelR.fileFormatSize];
            
            if (modelR.isDownLoaded) {
                cellR.progressBackView.hidden = YES;
                cellR.playURL = [[DownLoadDataTool shareInstance] getCachePathWithWithURL:modelR.downloadUrl orTrackID:modelR.trackId];
            }else {
                cellR.playURL = [NSURL URLWithString:modelR.playPathAacv164];
                cellR.progressBackView.hidden = NO;
                if (modelR.isDownLoading) {
                    cellR.downLoadOrPauseBtn.selected = YES;
                }else {
                    cellR.downLoadOrPauseBtn.selected = NO;
                }
            }
            
            
            // 判断是否正在播放
            if ([[PlayerService shareInstance].currentPlayURL isEqual:cellR.playURL] || [DownLoadDataTool shareInstance].currentTrackID == cellR.trackID) {
                cellR.playOrPauseBtn.selected = ([PlayerService shareInstance].state == AudioPlaying);
            }else {
                cellR.playOrPauseBtn.selected = NO;
            }
            
        }
        
        
        if ([cell isKindOfClass:[TodayFireVoiceCell class]]) {
            // 赋值
            TodayFireVoiceCell *cellR = (TodayFireVoiceCell *)cell;
            cellR.voiceTitleLabel.text = modelR.title;
            cellR.voiceAuthorLabel.text = [NSString stringWithFormat:@"by %@", modelR.nickname];
            
            [cellR.playOrPauseBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:modelR.coverSmall]  forState:UIControlStateNormal];
            cellR.sortNumLabel.text = [NSString stringWithFormat:@"%zd", modelR.sortNum];
            
            
            // 判断, 是否存在下载文件
            if ([[DownLoadDataTool shareInstance] isDownLoadedWithURL:modelR.downloadUrl orTrackID:modelR.trackId]) {
                cellR.downLoadState = CellDownLoadStateDownLoaded;
                cellR.playURL = [[DownLoadDataTool shareInstance] getCachePathWithWithURL:modelR.downloadUrl orTrackID:modelR.trackId];
            }else {
                cellR.downLoadState = CellDownLoadStateWait;
                cellR.playURL = [NSURL URLWithString:modelR.playPathAacv164];
            }
            
            
            
            cellR.clickBlock = modelR.clickBlock;
            
            
            // 判断是否正在播放
            if ([[PlayerService shareInstance].currentPlayURL isEqual:cellR.playURL] || [DownLoadDataTool shareInstance].currentTrackID == cellR.trackID) {
                cellR.playOrPauseBtn.selected = ([PlayerService shareInstance].state == AudioPlaying);
            }else {
                cellR.playOrPauseBtn.selected = NO;
            }
            cellR.trackID = modelR.trackId;
            
        }
        
        
    }
    
    
    if ([model isKindOfClass:[DownLoadAlbumModel class]]) {
        DownLoadAlbumModel *modelR = (DownLoadAlbumModel *)model;
        if ([cell isKindOfClass:[DownLoadAlbumCell class]]) {
            DownLoadAlbumCell *cellR = (DownLoadAlbumCell *)cell;
            
            // 赋值
            [cellR.albumImageView setURLImageWithURL:[NSURL URLWithString:modelR.albumCoverMiddle] progress:nil complete:nil];
            cellR.albumTitleLabel.text = modelR.albumTitle;
            [cellR.albumPartsBtn setTitle:[NSString stringWithFormat:@"%zd", modelR.trackCount] forState:UIControlStateNormal];
            cellR.albumAuthorLabel.text = [NSString stringWithFormat:@"by %@", modelR.nickname];
            [cellR.albumPartsSizeBtn setTitle:modelR.fileFormatSize forState:UIControlStateNormal];
            
            cellR.deleteBlock = modelR.deleteBlock;
            
        }
    }
    
    
    
    return nil;
}


@end
