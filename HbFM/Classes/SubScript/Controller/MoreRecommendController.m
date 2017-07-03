//
//  MoreRecommendController.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "MoreRecommendController.h"
#import "RecommendsCell.h"
#import "AlbumDetailController.h"
#import "Base.h"

@interface MoreRecommendController ()

@end

@implementation MoreRecommendController

static NSString * const recommendCellId = @"recommendCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}

- (void)initView
{
    self.title = @"相关推荐";
    self.view.backgroundColor = kCommonColor;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([RecommendsCell class]) bundle:[NSBundle bundleForClass:[self class]]] forCellReuseIdentifier:recommendCellId];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecommendsCell *cell = [tableView dequeueReusableCellWithIdentifier:recommendCellId];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:[[AlbumDetailController alloc]init] animated:YES];
}

@end
