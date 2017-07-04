//
//  AlbumTVC.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "AlbumTVC.h"
#import "DownLoadDataTool.h"
#import "DownLoadAlbumCell.h"
#import "SetValueTool.h"
#import "AlbumVoiceTVC.h"
#import "Base.h"
#import "DownLoadService.h"

@interface AlbumTVC ()

@property (nonatomic, strong) NSArray<DownLoadAlbumModel *> *downLoadingAlbumMs;

@end

@implementation AlbumTVC

-(void)setDownLoadingAlbumMs:(NSArray<DownLoadAlbumModel *> *)downLoadingAlbumMs
{
    _downLoadingAlbumMs = downLoadingAlbumMs;
    [self.tableView reloadData];
}

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.rowHeight = 68;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadData];
}


- (void)loadData {
    
    kWeakSelf;
    [[DownLoadDataTool shareInstance] getCurrentDownLoadedAlbumMs:^(NSArray<DownLoadAlbumModel *> *downLoadingAlbumMs) {
        weakSelf.downLoadingAlbumMs = downLoadingAlbumMs;
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger count = self.downLoadingAlbumMs.count;
    
    self.showNoDataPane = (count == 0);
    
    return count;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DownLoadAlbumCell *cell = [DownLoadAlbumCell cellWithTableView:tableView];
    
    DownLoadAlbumModel *model = self.downLoadingAlbumMs[indexPath.row];
    
    __weak DownLoadAlbumModel *weakM = model;
    
    kWeakSelf;
    model.deleteBlock = ^{
        [[DownLoadDataTool shareInstance] deleteDownLoadVocieModelsWithAlbumID:weakM.albumId];
        [weakSelf loadData];
        
        // 发通知,
        [[NSNotificationCenter defaultCenter] postNotificationName:kDownLoadStateChangeNotification object:nil];
        
    };
    
    [SetValueTool setModel:model toCell:cell];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AlbumVoiceTVC *voiceVC = [[AlbumVoiceTVC alloc] init];
    voiceVC.albumM = self.downLoadingAlbumMs[indexPath.row];
    [self.navigationController pushViewController:voiceVC  animated:YES];
    
    
}

@end
