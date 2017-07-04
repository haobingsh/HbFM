//
//  DownLoadingTVC.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "DownLoadingTVC.h"
#import "DownLoadDataTool.h"
#import "DownLoadVoiceCell.h"
#import "SetValueTool.h"
#import "DownLoadService.h"
#import "Base.h"

@interface DownLoadingTVC ()

@property (nonatomic, strong) NSArray<DownLoadVoiceModel *> *downLoadingVoiceMs;

@property (nonatomic, weak) NSTimer *updateTimer;

@end

@implementation DownLoadingTVC

- (NSTimer *)updateTimer
{
    if (_updateTimer == nil) {
        NSTimer *updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(updateCellProgress) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:updateTimer forMode:NSRunLoopCommonModes];
        _updateTimer = updateTimer;
    }
    return _updateTimer;
}


- (void)updateCellProgress {
    
    // 取出所有可见的cell indexPath
    NSArray *indexPathes = [self.tableView indexPathsForVisibleRows];
    
    
    // 遍历cell, 给进度赋值
    for (NSIndexPath *indexPath in indexPathes) {
        
        DownLoadVoiceModel *model = self.downLoadingVoiceMs[indexPath.row];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        [SetValueTool setModel:model toCell:cell];
        
    }
    
}


- (void)loadData {
    kWeakSelf;
    [[DownLoadDataTool shareInstance] getCurrentDownLoadingVoiceMs:^(NSArray<DownLoadVoiceModel *> *downLoadingVoiceMs) {
        weakSelf.downLoadingVoiceMs = downLoadingVoiceMs;
    }];
    
}


-(void)setDownLoadingVoiceMs:(NSArray<DownLoadVoiceModel *> *)downLoadingVoiceMs
{
    _downLoadingVoiceMs = downLoadingVoiceMs;
    [self.tableView reloadData];
    
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadData];
    [self.updateTimer fire];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.updateTimer invalidate];
    self.updateTimer = nil;
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
    model.downLoadBlock = ^(BOOL isDownLoad) {
        if (isDownLoad) {
            [DownLoadService downLoadVoiceM:weakModel];
        }else {
            [DownLoadService pauseVoiceM:weakModel];
        }
    };
    
    kWeakSelf;
    model.deleteBlock = ^{
        // 删除下载任务以及下载缓存
        [DownLoadService stopVoiceM:weakModel];
        
        // 删除记录
        [[DownLoadDataTool shareInstance] deleteVoiceDownLoadedModelWithURL:weakModel.downloadUrl];
        [weakSelf loadData];
    };
    
    
    [SetValueTool setModel:model toCell:cell];
    
    return cell;
}


@end
