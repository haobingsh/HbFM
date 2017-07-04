//
//  VoiceTVC.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "VoiceTVC.h"
#import "DownLoadDataTool.h"
#import "DownLoadVoiceCell.h"
#import "SetValueTool.h"
#import "DownLoadService.h"
#import "Base.h"
#import "DownLoadAPIDefine.h"


@interface VoiceTVC ()

@property (nonatomic, strong) NSArray<DownLoadVoiceModel *> *downLoadingVoiceMs;

@end

@implementation VoiceTVC

-(void)setDownLoadingVoiceMs:(NSArray<DownLoadVoiceModel *> *)downLoadingVoiceMs
{
    _downLoadingVoiceMs = downLoadingVoiceMs;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 80;
    
    
    
}

- (void)loadData {
    kWeakSelf;
    [[DownLoadDataTool shareInstance] getCurrentDownLoadedVoiceMs:^(NSArray<DownLoadVoiceModel *> *downLoadingVoiceMs) {
        weakSelf.downLoadingVoiceMs = downLoadingVoiceMs;
    }];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadData];
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger count = self.downLoadingVoiceMs.count;
    self.showNoDataPane = (count == 0);
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DownLoadVoiceCell *cell = [DownLoadVoiceCell cellWithTableView:tableView];
    DownLoadVoiceModel *model = self.downLoadingVoiceMs[indexPath.row];
    
    __weak DownLoadVoiceModel *weakModel = model;
    model.deleteBlock = ^{
        // 删除下载任务以及下载缓存
        [DownLoadService stopVoiceM:weakModel];
        
        // 删除记录
        [[DownLoadDataTool shareInstance] deleteVoiceDownLoadedModelWithURL:weakModel.downloadUrl];
        
        // 发通知,
        [[NSNotificationCenter defaultCenter] postNotificationName:kDownLoadStateChangeNotification object:nil];
    };
    
    [SetValueTool setModel:model toCell:cell];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DownLoadVoiceModel *model = self.downLoadingVoiceMs[indexPath.row];
    
    kPresentToPlayer(@(model.trackId))
    
}

@end
