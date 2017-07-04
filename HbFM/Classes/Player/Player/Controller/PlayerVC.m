//
//  PlayerVC.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "PlayerVC.h"

#import "PlayerDataTool.h"
#import "PlayerService.h"

#import "TitleScrollView.h"
#import "PlayerPane.h"

#import "RewardView.h"
#import "UserInfoCell.h"

#import "PlayerGroupCell.h"
#import "RecommendListTVC.h"
#import "CommentTVC.h"

#import "UIView+FmLayout.h"
#import "Base.h"
#import "PlayerDefine.h"

@interface PlayerVC ()

@property (nonatomic, strong) PlayerPane *playerPane;

@property (nonatomic, weak) TitleScrollView *titleScrollView;

@property (nonatomic, strong) RewardView *rewardView;


@property (nonatomic, strong) NSMutableArray *cellModels;

@end

@implementation PlayerVC

static UINavigationController *shareNavIntance;

+ (UINavigationController *)shareInstanceWithAlbumId: (NSInteger)albumId trackUid:(NSInteger)trackUid isUseCache: (BOOL)isUseCache
{
    if (shareNavIntance == nil) {
        PlayerVC *playerVC = [[PlayerVC alloc] initWithStyle:UITableViewStyleGrouped];
        shareNavIntance = [[UINavigationController alloc] initWithRootViewController:playerVC];
    }
    if (!isUseCache) {
        PlayerVC *playerVC = shareNavIntance.childViewControllers[0];
        
        if (playerVC.trackUid != trackUid) {
            playerVC.albumId = albumId;
            playerVC.trackUid = trackUid;
            [playerVC loadData];
        }
        
    }else {
        
        // 继续播放当前音频
        [[PlayerService shareInstance] playCurrentAudio];
        
    }
    
    return shareNavIntance;
}


-(RewardView *)rewardView {
    if (_rewardView == nil) {
        
        _rewardView = [[NSBundle bundleForClass:[self class]] loadNibNamed:@"RewardView" owner:nil options:nil].firstObject;
        
    }
    return _rewardView;
}

-(NSMutableArray *)cellModels
{
    if (_cellModels == nil) {
        _cellModels = [NSMutableArray array];
    }
    return _cellModels;
}


-(TitleScrollView *)titleScrollView {
    if (_titleScrollView == nil) {
        
        TitleScrollView *titleScrollView = [[TitleScrollView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        self.navigationItem.titleView = titleScrollView;
        _titleScrollView = titleScrollView;
        
    }
    return _titleScrollView;
}


-(PlayerPane *)playerPane {
    if (!_playerPane) {
        
        _playerPane = [[NSBundle bundleForClass:[self class]] loadNibNamed:@"PlayerPane" owner:nil options:nil].firstObject;
        _playerPane.height = 430;
    }
    return _playerPane;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpInit];
    
    
}



- (void)setUpInit {
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    NSString *normalImagePath = [[NSBundle bundleForClass:self] pathForResource:@"playingback_h@2x.png" ofType:nil];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageWithContentsOfFile:normalImagePath] forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    
    // 设置关闭按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    // 设置表格顶部视图
    self.tableView.tableHeaderView = self.playerPane;
    
    // 加载数据
    [self loadData];
    
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
}



- (void)loadData {
    
    //    http://mobile.ximalaya.com/v1/track/ca/playpage/19668798?albumId=294567&device=iPhone&trackUid=16960840
    
    
    //    [[XMGPlayerDataTool shareInstance] getRewardList:^{
    //
    //    }];
    
    
    kWeakSelf
    [[PlayerDataTool shareInstance] getPlayerDataWithAlbumId:self.albumId trackUid: self.trackUid result:^(TrackInfoModel *trackM, AlbumInfoModel *albumInfoM, PlayerGroupModel *associationAlbumM, UserInfoModel *userInfoM, PlayerCommentGroupModel *commentGroupM, TrackRewardInfoModel *rewardInfoM) {
        
        if (albumInfoM == nil || trackM == nil) {
            
            return ;
        }
        
        // 清空数据
        self.cellModels = nil;
        [self.tableView reloadData];
        
        
        // 设置播放面板
        self.playerPane.trackM = trackM;
        self.playerPane.userInfoM = userInfoM;
        
        // 设置标题
        self.titleScrollView.showContent = trackM.title;
        
        // 用户信息
        [self.cellModels addObject:albumInfoM];
        
        
        associationAlbumM.clickBlock = ^{
            RecommendListTVC *listTVC = [[RecommendListTVC alloc] init];
            listTVC.albumId = albumInfoM.albumId;
            [weakSelf.navigationController pushViewController:listTVC animated:YES];
            
        };
        [self.cellModels addObject:associationAlbumM];
        
        
        commentGroupM.clickBlock = ^{
            
            CommentTVC *commentTVC = [[CommentTVC alloc] init];
            commentTVC.trackId = self.trackUid;
            [weakSelf.navigationController pushViewController:commentTVC animated:YES];
            
        };
        [self.cellModels addObject:commentGroupM];
        
        [self.tableView reloadData];
        
        //设置打赏
        self.rewardView.rewardInfoM = rewardInfoM;
        
        
        
    }];
    
}


- (void)close {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  self.cellModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = self.cellModels[indexPath.section];
    UITableViewCell *cell;
    if ([model isKindOfClass:[AlbumInfoModel class]]) {
        cell = [UserInfoCell cellWithTableView:tableView];
        [(UserInfoCell *)cell setAlbumInfoM:model];
    }
    
    if ([model isKindOfClass:[PlayerGroupModel class]]) {
        cell = [PlayerGroupCell cellWithTableView:tableView];
        [(PlayerGroupCell *)cell setAssociationAlbumGroupM:model];
    }
    
    if ([model isKindOfClass:[PlayerCommentGroupModel class]]) {
        cell = [PlayerGroupCell cellWithTableView:tableView];
        [(PlayerGroupCell *)cell setCommentGroupM:model];
    }
    
    return cell;
}





- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return self.rewardView;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 140;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    PlayerFrameModel *model = self.cellModels[indexPath.section];
    
    return model.cellHeight;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PlayerFrameModel *model = self.cellModels[indexPath.section];
    if ([model isKindOfClass:[AlbumInfoModel class]]) {
        // 跳转到专辑详情
        kJumpToAlbumDetail(@(((AlbumInfoModel *)model).albumId), self.navigationController)
    }
    
    if ([model isKindOfClass:[UserInfoCell class]]) {
        NSLog(@"跳转到用户详情");
    }
    
}

@end
