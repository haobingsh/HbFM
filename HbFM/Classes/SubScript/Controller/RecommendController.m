//
//  RecommendController.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "RecommendController.h"
#import "RecommendsCell.h"
#import "SubscribleDataTool.h"
#import "AlbumDetailController.h"

@interface RecommendController ()

@property (nonatomic, strong)NSArray *recommendList;

@end

@implementation RecommendController

static NSString * const recommendCellId = @"recommendCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[SubscribleDataTool shareInstance] getRecommandList:^(NSArray<NSString *> *recommendList, NSError *error) {
        self.recommendList = recommendList;
        [self.tableView reloadData];
    }];
    
    [self initView];
}

- (void)initView
{
    
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([RecommendsCell class]) bundle:[NSBundle bundleForClass:[self class]]] forCellReuseIdentifier:recommendCellId] ;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.recommendList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecommendsCell *cell = [tableView dequeueReusableCellWithIdentifier:recommendCellId];
    cell.recommends = self.recommendList[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Recommends *recommends = self.recommendList[indexPath.row];
    return recommends.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Recommends *recommends = self.recommendList[indexPath.row];
    
    AlbumDetailController *vc =[[AlbumDetailController alloc]init];
    vc.albumId = recommends.albumId;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
