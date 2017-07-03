//
//  AnchoController.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "AnchoController.h"
#import "AnchoHeaderView.h"
#import "RecommendsCell.h"
#import "AlbumDetaiVedioCell.h"
#import "Base.h"

@interface AnchoController ()

@property (nonatomic, strong) AnchoHeaderView *headerView;

@end

@implementation AnchoController

- (AnchoHeaderView *)headerView
{
    if (_headerView == nil) {
        _headerView = [[NSBundle bundleForClass:[self class]] loadNibNamed:@"AnchoHeaderView" owner:nil options:nil].firstObject;
        _headerView.frame = CGRectMake(0, 0, kScreenWidth, 280.5);
    }
    return _headerView;
}

static NSString * const vedioCellId = @"vedioCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}

- (void)initView
{
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bigShadow.png"] forBarMetrics:UIBarMetricsDefault];
    
    self.tableView.tableHeaderView = self.headerView;
    //    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AlbumDetaiVedioCell class]) bundle:[NSBundle bundleForClass:[self class]]] forCellReuseIdentifier:vedioCellId];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else
    {
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        RecommendsCell *cell = [[NSBundle bundleForClass:[self class]] loadNibNamed:@"RecommendsCell" owner:nil options:nil].firstObject;
        return cell;
    }else{
        AlbumDetaiVedioCell *cell = [tableView dequeueReusableCellWithIdentifier:vedioCellId];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 90;
    }else
    {
        return 78;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"发布的专辑（1）";
    }else
    {
        return @"发布的声音（10）";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

@end
