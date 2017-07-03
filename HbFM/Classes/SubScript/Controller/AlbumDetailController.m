//
//  AlbumDetailController.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "AlbumDetailController.h"
#import "AlbumDetailHeaderView.h"
#import "SegmentBar.h"
#import "AlbumDetaiVedioCell.h"
#import "VedioFuncCell.h"
#import "AlbumDetailContentCell.h"
#import "AlbumAnchoCell.h"
#import "AlbumTagCell.h"
#import "AlbumRecommendCell.h"
#import "AnchoController.h"
#import "MoreRecommendController.h"
#import "SubscribleDataTool.h"
#import "AlbumDetailInfo.h"
#import "AnchorInfo.h"

#import "DownLoadController.h"
#import "TagController.h"
#import "Base.h"
#import "FMConst.h"
#import "SubcriptDefine.h"

@interface AlbumDetailController ()<SegmentBarDelegate,AlbumRecommendCellDelegate,AlbumTagCellDelegate>

@property (nonatomic, strong) AlbumDetailHeaderView *headerView;
@property (nonatomic, strong) SegmentBar *setmentBar;
@property (nonatomic, strong) NSArray *menuBarArray;
@property (nonatomic,assign)  NSInteger selectedIndex;
@property (nonatomic, strong) AlbumMenu *albumMenu;
@property (nonatomic, strong) AlbumDetail *albumDetail;

@property (nonatomic, strong) NSArray *menuListArr;

@end

@implementation AlbumDetailController

-(NSArray *)menuBarArray
{
    if (_menuBarArray == nil) {
        _menuBarArray = @[@"详情",@"节目(21)"];
    }
    return _menuBarArray;
}

- (AlbumDetailHeaderView *)headerView
{
    if (_headerView == nil) {
        _headerView = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"AlbumDetailHeaderView" owner:nil options:nil] firstObject];
        _headerView.frame = CGRectMake(0, 0, kScreenWidth, 205);
    }
    return _headerView;
}

static NSString * const vedioCellId = @"vedioCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 请求网络数据
    [[SubscribleDataTool shareInstance] getAlbumMenuWithAlbumId:self.albumId result:^(AlbumMenu *albumMenu, NSError *error) {
        self.headerView.album = albumMenu.album;
        self.menuListArr = albumMenu.tracks.list;
        
        [self.tableView reloadData];
    }];
    
    // 请求网络数据
    [[SubscribleDataTool shareInstance] getAlbumDetailWithAlbumId:self.albumId result:^(AlbumDetail *albumDetail, NSError *error) {
        self.albumDetail = albumDetail;
        [self.tableView reloadData];
    }];
    
    
    
    [self initView];
}


- (void)loadList {
    [[SubscribleDataTool shareInstance] getAlbumTrackListWithAlbumId:self.albumId result:^(Tracks *tracks, NSError *error){
        self.menuListArr = tracks.list;
        [self.tableView reloadData];
    }];
}

- (void)initView
{
    self.title = @"专辑详情";
    self.view.backgroundColor = kCommonColor;
    
    // 点击主题进行跳转
    kWeakSelf
    self.headerView.callBackClickAlbum = ^(NSInteger tag){
        switch (tag) {
            case 0:  // 主题
            {
                AnchoController *ancho = [[AnchoController alloc] init];
                [weakSelf.navigationController pushViewController:ancho animated:YES];
            }
                break;
            case 1:  // 分类
            {
                
            }
                break;
            case 2:  // 订阅专辑
            {
                
            }
                break;
            case 3:  // 批量下载
            {
                DownLoadController *downloadVc = [[DownLoadController alloc]init];
                downloadVc.albumId = weakSelf.albumId;
                [weakSelf.navigationController pushViewController:downloadVc animated:YES];
            }
                break;
            default:
                break;
        }
        
    };
    self.tableView.tableHeaderView = self.headerView;
    
    self.selectedIndex = 0;
    //    if (self.selectedIndex == 1) { // 节目
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AlbumDetaiVedioCell class]) bundle:[NSBundle bundleForClass:[self class]]] forCellReuseIdentifier:vedioCellId];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    }
}

#pragma mark - MenueBarDelegate
- (void)segmentBarDidSelectIndex: (NSInteger)toIndex fromIndex: (NSInteger)fromIndex
{
    self.selectedIndex = toIndex;
    if (toIndex == 1) { // 节目
        if (self.menuListArr.count == 0) {
            [self loadList];
        }else {
            [self.tableView reloadData];
        }
        
    }else{ // 详情
        [self.tableView reloadData];
    }
    
    FMLog(@"=========%zd",self.selectedIndex);
}

#pragma mark - AlbumRecommendCellDelegate
- (void)albumRecommendCellDidSelectCell:(NSString *)albumId
{
    AlbumDetailController *vc =[[AlbumDetailController alloc]init];
    vc.albumId = albumId;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - AlbumTagCellDelegate
- (void)albumTagCellDidClickTagButton
{
    TagController *tagVc = [[TagController alloc]init];
    [self.navigationController pushViewController:tagVc animated:YES];
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.selectedIndex == 1) { // 节目
        return self.menuListArr.count;
    }else
    {
        return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectedIndex == 1) {
        if (indexPath.row == 0) {
            //
            VedioFuncCell *cell = [[NSBundle bundleForClass:[VedioFuncCell class]] loadNibNamed:@"VedioFuncCell" owner:nil options:nil].firstObject;
            return cell;
        }else
        {
            AlbumDetaiVedioCell *cell = [tableView dequeueReusableCellWithIdentifier:vedioCellId];
            cell.track = self.menuListArr[indexPath.row];
            return cell;
        }
    }else if (self.selectedIndex == 0)
    {
        switch (indexPath.row) {
            case 0:
            {
                AlbumDetailContentCell *cell = [[NSBundle bundleForClass:[AlbumDetailContentCell class]] loadNibNamed:@"AlbumDetailContentCell" owner:nil options:nil].firstObject;
                cell.albumDetailInfo  = self.albumDetail.detail;
                return cell;
            }
                break;
            case 1:
            {
                AlbumAnchoCell *cell = [[NSBundle bundleForClass:[AlbumAnchoCell class]] loadNibNamed:@"AlbumAnchoCell" owner:nil options:nil].firstObject;
                cell.anchorInfo = self.albumDetail.user;
                return cell;
            }
                break;
            case 2:
            {
                AlbumTagCell *cell = [[NSBundle bundleForClass:[AlbumTagCell class]] loadNibNamed:@"AlbumTagCell" owner:nil options:nil].firstObject;
                cell.delegate = self;
                return cell;
            }
                break;
            case 3:
            {
                AlbumRecommendCell *cell = [[NSBundle bundleForClass:[AlbumRecommendCell class]] loadNibNamed:@"AlbumRecommendCell" owner:nil options:nil].firstObject;
                cell.delegate = self;
                cell.otherRecommands = self.albumDetail.recs;
                kWeakSelf
                cell.getMoreRecommend = ^{
                    MoreRecommendController *moreRecommend = [[MoreRecommendController alloc] init];
                    [weakSelf.navigationController pushViewController:moreRecommend animated:YES];
                };
                return cell;
            }
                break;
        }
    }
    return nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.selectedIndex == 1 && indexPath.row > 0){  // 点击节目中的cell
        Track *track = self.menuListArr[indexPath.row];
        
        kPresentToPlayer(@(track.trackId))
        
    }else{
        if (indexPath.row == 1) {
            
            AnchoController *ancho = [[AnchoController alloc] init];
            [self.navigationController pushViewController:ancho animated:YES];
        }
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectedIndex == 1) {
        if (indexPath.row == 0) {
            return 30;
        }else
        {
            Track *track = [self.menuListArr objectAtIndex:indexPath.row];
            FMLog(@"cellheight ======= %.2f",track.cellHeight);
            return track.cellHeight + 20;
        }
    }else{
        switch (indexPath.row) {
            case 0:
            {
                AlbumDetailInfo *albumDetailInfo  = self.albumDetail.detail;
                return albumDetailInfo.contentCellHeight;
            }
                break;
            case 1:
            {
                AnchorInfo *anchorInfo = self.albumDetail.user;
                return anchorInfo.anchorCellHeight;
            }
                break;
            case 2:
                return 88;
                break;
            case 3:
            {
                return 420;
            }
                break;
            default:
                break;
        }
    }
    return 0;
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // 1. 设置菜单栏
    SegmentBar *setmentBar = [[SegmentBar alloc] initWithFrame:CGRectMake(0, kNavigationBarMaxY, kScreenWidth, kMenueBarHeight)];
    setmentBar.segmentMs = self.menuBarArray;
    if (self.selectedIndex == 1) {
        setmentBar.selectedIndex = 1;
    }else
    {
        setmentBar.selectedIndex = 0;
    }
    setmentBar.delegate = self;
    self.setmentBar = setmentBar;
    setmentBar.backgroundColor = [UIColor whiteColor];
    return setmentBar;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kMenueBarHeight;
}

@end
