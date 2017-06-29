//
//  RecommendListTVC.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "RecommendListTVC.h"
#import "AlbumInfoModel.h"
#import "PlayerCell.h"

#import "PlayerDataTool.h"
#import "Base.h"

#import "PlayerDefine.h"

@interface RecommendListTVC ()

@property (nonatomic, strong) NSArray <AlbumInfoModel *>*albumMs;

@end

@implementation RecommendListTVC

-(void)setAlbumMs:(NSArray *)albumMs {
    _albumMs = albumMs;
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 70;
    self.title = @"相关推荐";
    
    //    http://ar.ximalaya.com/rec-association/recommend/album/by_album?albumId=294567&device=iPhone
    kWeakSelf
    [[PlayerDataTool shareInstance] getRecommendMsWithAlbumId:self.albumId result:^(NSArray<AlbumInfoModel *> *albumInfoMs) {
        weakSelf.albumMs = albumInfoMs;
    }];
    
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.albumMs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PlayerCell *cell = [PlayerCell cellWithTableView:tableView];
    
    AlbumInfoModel *model = self.albumMs[indexPath.row];
    
    cell.albumInfoM = model;
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AlbumInfoModel *model = self.albumMs[indexPath.row];
    // 跳转到专辑详情
    kJumpToAlbumDetail(@(model.albumId), self.navigationController)
    
    //    XMGAlbumDetailController *detailTVC = [[XMGAlbumDetailController alloc] initWithStyle:UITableViewStylePlain];
    //    XMGAlbumInfoModel *model = self.albumMs[indexPath.row];
    //    detailTVC.albumId = [NSString stringWithFormat:@"%zd", model.albumId];
    //    [self.navigationController pushViewController:detailTVC animated:YES];
    
}

@end
