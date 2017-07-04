//
//  TodayFireVoiceListTVC.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "TodayFireVoiceListTVC.h"
#import "TodayFireVoiceCell.h"
#import "DownLoadDataTool.h"
#import "SetValueTool.h"
#import "DownLoadService.h"

#import "Base.h"
#import "PlayerService.h"
#import "DownLoadAPIDefine.h"

@interface TodayFireVoiceListTVC ()

@property (nonatomic, strong) NSArray<DownLoadVoiceModel *> *voiceMs;

@property (nonatomic, weak) NSTimer *updateTimer;

@end

@implementation TodayFireVoiceListTVC

-(void)setVoiceMs:(NSArray<DownLoadVoiceModel *> *)voiceMs
{
    _voiceMs = voiceMs;
    [self.tableView reloadData];
}

-(void)setLoadKey:(NSString *)loadKey
{
    _loadKey = loadKey;
    
    kWeakSelf;
    [[DownLoadDataTool shareInstance] getVoiceMsWithKey:loadKey pageNum:1 result:^(NSArray<DownLoadVoiceModel *> *voiceMs) {
        weakSelf.voiceMs = voiceMs;
    }];
    
    
}

-(void)viewDidLoad
{
    self.tableView.rowHeight = 80;
}




#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.voiceMs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TodayFireVoiceCell *cell = [TodayFireVoiceCell cellWithTableView:tableView];
    
    DownLoadVoiceModel *model = self.voiceMs[indexPath.row];
    __weak DownLoadVoiceModel *weakModel = model;
    model.clickBlock = ^{
        
        [[DownLoadDataTool shareInstance] setDownLoadMessageToVoiceM: weakModel complete:^{
            [DownLoadService downLoadVoiceM:weakModel];
        }];
        
    };
    
    model.sortNum = indexPath.row + 1;
    
    [SetValueTool setModel:model toCell:cell];
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DownLoadVoiceModel *model = self.voiceMs[indexPath.row];
    
    kPresentToPlayer(@(model.trackId))
    
}

@end
