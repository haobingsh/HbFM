//
//  AlbumVoiceTVC.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "AlbumVoiceTVC.h"
#import "DownLoadVoiceModel.h"
#import "DownLoadDataTool.h"
#import "Base.h"


@interface AlbumVoiceTVC ()

@property (nonatomic, strong) NSArray<DownLoadVoiceModel *> *downLoadingVoiceMs;

@end

@implementation AlbumVoiceTVC

-(void)setDownLoadingVoiceMs:(NSArray<DownLoadVoiceModel *> *)downLoadingVoiceMs
{
    _downLoadingVoiceMs = downLoadingVoiceMs;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    self.title = self.albumM.albumTitle;
    
}

- (void)loadData {
    
    kWeakSelf;
    self.downLoadingVoiceMs = nil;
    [[DownLoadDataTool shareInstance] getCurrentDownLoadedAlbumMs:^(NSArray<DownLoadAlbumModel *> *downLoadingAlbumMs) {
        
        for (int i = 0; i < downLoadingAlbumMs.count; i ++) {
            DownLoadAlbumModel *albumM = downLoadingAlbumMs[i];
            
            if (albumM.albumId == self.albumM.albumId) {
                weakSelf.downLoadingVoiceMs = albumM.voiceMs;
                break;
            }
        }
        
        [weakSelf.tableView reloadData];
        
    }];
    
}


@end
