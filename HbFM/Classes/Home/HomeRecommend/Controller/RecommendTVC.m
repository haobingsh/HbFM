//
//  RecommendTVC.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "RecommendTVC.h"
#import "AdPicView.h"
#import "AdPicModel.h"
#import "MenueView.h"

#import "RecommendCell.h"
#import "AdPicTextCell.h"
#import "SpecialColumnCell.h"
#import "UIImageView+FMExtension.h"
#import "UIButton+WebCache.h"
#import "Base.h"
#import "FMConst.h"
#import "UIView+FMLayout.h"
#import "RecommendDataTool.h"
#import <SafariServices/SafariServices.h>
#import "HomeRecommendDefine.h"

@interface RecommendTVC ()

@property (nonatomic, strong) AdPicView *adPicView;

@property (nonatomic, strong) MenueView *menueView;

@property (nonatomic, strong) NSMutableArray *listMs;

@end

@implementation RecommendTVC

@synthesize listMs = _listMs;

-(NSMutableArray *)listMs
{
    if (_listMs == nil) {
        _listMs = [NSMutableArray array];
    }
    
    // 根据模型的sortID进行排序
    [_listMs sortUsingComparator:^NSComparisonResult(GroupModel *obj1, GroupModel *obj2) {
        
        if (obj1.sortID < obj2.sortID) {
            return NSOrderedAscending;
        }
        return NSOrderedDescending;
    }];
    
    return _listMs;
}

-(void)setListMs:(NSMutableArray *)listMs
{
    _listMs = listMs;
    [self.tableView reloadData];
}


-(AdPicView *)adPicView {
    if (_adPicView == nil) {
        AdPicView *adPicView = [AdPicView picViewWithLoadImageBlock:^(UIImageView *imageView, NSURL *url) {
            [imageView setURLImageWithURL:url progress:nil complete:nil];
        }];
        _adPicView = adPicView;
    }
    return _adPicView;
}

-(MenueView *)menueView {
    
    if(_menueView == nil)
    {
        MenueView *menueView = [[MenueView alloc] initWithFrame:CGRectZero];
        menueView.loadBlock = ^(UIButton *imageBtn, NSURL *url){
            [imageBtn sd_setImageWithURL:url forState:UIControlStateNormal];
        };
        _menueView = menueView;
    }
    return _menueView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = FMColor(225, 225, 225);
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];
    headerView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = headerView;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, kCommonMargin, 0);
    
    // 设置图片轮播器
    // 封装图片轮播器
    [self.tableView.tableHeaderView addSubview:self.adPicView];
    self.adPicView.frame = CGRectMake(0, 0, kScreenWidth, 150);
    
    // 设置菜单栏
    [self.tableView.tableHeaderView addSubview:self.menueView];
    self.menueView.frame = CGRectMake(0, self.adPicView.height, kScreenWidth, 100);
    
    
    // 加载广告
    kWeakSelf;
    [[RecommendDataTool shareInstance] getAdList:^(NSArray<XMGAdPicModel *> *adMs, NSError *error) {
        
        for (int i = 0; i < adMs.count; i ++) {
            XMGAdPicModel *adM = adMs[i];
            __weak AdPicModel *weakAdM = adM;
            weakAdM.clickBlock = ^{
                
                NSInteger type = weakAdM.focusImageM.type;
                
                NSInteger albumID = weakAdM.focusImageM.albumId;
                
                UINavigationController *nav = self.navigationController;
                
                if (type == 9) {
                    NSLog(@"听单处理");
                }
                
                if (type == 3) {
                    NSLog(@"播放器界面");
                    NSString *albumID = [NSString stringWithFormat:@"%zd", weakAdM.focusImageM.trackId];
                    kPresentToPlayer(albumID)
                    
                }else if (type == 2) {
                    NSLog(@"跳转到专辑详情");
                    // 跳转到专辑详情
                    UINavigationController *nav = self.navigationController;
                    NSString *albumIDStr = [NSString stringWithFormat:@"%zd", albumID];
                    kJumpToAlbumDetail(albumIDStr, nav)
                }else if (type == 4) {
                    
                    // 打开网页
                    SFSafariViewController *sfvc = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:weakAdM.focusImageM.url]];
                    sfvc.title = @"商城";
                    [nav pushViewController:sfvc animated:YES];
                }
                
                
                
                
            };
        }
        
        weakSelf.adPicView.picModels = adMs;
    }];
    
    
    // 加载 图文菜单列表
    [[RecommendDataTool shareInstance] getPicMenueList:^(NSArray *menuePicMs, NSError *error) {
        weakSelf.menueView.menueModels = menuePicMs;
    }];
    
    // 加载 小编推荐
    [[RecommendDataTool shareInstance] getEditorRecommendAlbums:^(GroupModel *groupM, NSError *error) {
        NSLog(@"%@", groupM.title);
        groupM.sortID = 1;
        [weakSelf.listMs addObject:groupM];
        [weakSelf.tableView reloadData];
    }];
    
    // 加载 现场直播
    [[RecommendDataTool shareInstance] getLiveMs:^(GroupModel *groupM, NSError *error) {
        NSLog(@"%@", groupM.liveMs);
        groupM.sortID = 2;
        [weakSelf.listMs addObject:groupM];
        [weakSelf.tableView reloadData];
    }];
    
    // 加载 精品听单
    [[RecommendDataTool shareInstance] getSpecialColumnMs:^(GroupModel *groupM, NSError *error) {
        groupM.sortID = 4;
        NSLog(@"%@", groupM);
        [weakSelf.listMs addObject:groupM];
        [weakSelf.tableView reloadData];
    }];
    
    // 加载 推广
    [[RecommendDataTool shareInstance] getTuiGuangMs:^(GroupModel *groupM, NSError *error) {
        groupM.sortID = 5;
        [weakSelf.listMs addObject:groupM];
        [weakSelf.tableView reloadData];
    }];
    
    // 加载  听"广州"
    [[RecommendDataTool shareInstance] getCityAlbums:^(GroupModel *groupM, NSError *error) {
        groupM.sortID = 3;
        [weakSelf.listMs addObject:groupM];
        [weakSelf.tableView reloadData];
        
    }];
    
    // 加载 "热门推荐"
    [[RecommendDataTool shareInstance] getHotRecommendsAlbums:^(NSArray<GroupModel *> *groupMs, NSError *error) {
        
        [weakSelf.listMs addObjectsFromArray:groupMs];
        [weakSelf.tableView reloadData];
        
    }];
    
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.listMs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GroupModel *groupM = self.listMs[indexPath.row];
    
    UITableViewCell *cell;
    
    if (groupM.cellType == CellTypeList3) {
        
        cell = [RecommendCell cellWithTableView:tableView];
        [(RecommendCell *)cell setGroupM:groupM];
        
    }else if(groupM.cellType == CellTypeList1) {
        
        cell = [AdPicTextCell cellWithTableView:tableView];
        [(AdPicTextCell *)cell setGroupM:groupM];
        
    }else if(groupM.cellType == CellTypeList2) {
        
        cell = [SpecialColumnCell cellWithTableView:tableView];
        [(SpecialColumnCell *)cell setGroupM:groupM];
    }
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GroupModel *groupM = self.listMs[indexPath.row];
    
    if (groupM.cellType == CellTypeList1) {
        return 210;
    }
    
    if (groupM.cellType == CellTypeList3) {
        return 240;
    }
    
    if (groupM.cellType == CellTypeList2) {
        return 210;
    }
    
    return 0;
}

@end
