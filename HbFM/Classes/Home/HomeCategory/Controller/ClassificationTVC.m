//
//  ClassificationTVC.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "ClassificationTVC.h"
#import "AdPicView.h"
#import "MenueView.h"
#import "ClassItemModel.h"
#import "ClassificationDataTool.h"
#import "ClassItemCell.h"
#import "NSArray+FMPartition.h"
#import "UIImageView+FMExtension.h"
#import "UIButton+WebCache.h"
#import "Base.h"
#import "FMConst.h"
#import "UIView+FMLayout.h"

@interface ClassificationTVC ()

@property (nonatomic, strong) AdPicView *adPicView;

@property (nonatomic, strong) MenueView *menueView;

@property (nonatomic, strong) NSArray *classItemArrays;


@end


@implementation ClassificationTVC

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
        menueView.loadBlock = ^(UIButton *btn, NSURL *url) {
            [btn sd_setImageWithURL:url forState:UIControlStateNormal];
        };
        _menueView = menueView;
    }
    return _menueView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = FMColor(225, 225, 225);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone; // 去除cell底部的横线
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];
    headerView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = headerView;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, kCommonMargin, 0);
    
    NSBundle *bundle = [NSBundle bundleForClass:[ClassItemCell class]];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ClassItemCell" bundle:bundle] forCellReuseIdentifier:@"ClassItemCell"];
    
    // 设置图片轮播器
    // 封装图片轮播器
    [self.tableView.tableHeaderView addSubview:self.adPicView];
    self.adPicView.frame = CGRectMake(0, 0, kScreenWidth, 150);
    
    
    
    // 设置菜单栏
    [self.tableView.tableHeaderView addSubview:self.menueView];
    self.menueView.frame = CGRectMake(0, self.adPicView.height, kScreenWidth, 100);
    
    
    // 加载 广告
    kWeakSelf
    [[ClassificationDataTool shareInstance] getAdList:^(NSArray<AdPicModel *> *adMs, NSError *error) {
        weakSelf.adPicView.picModels = adMs;
    }];
    
    // 加载 图文菜单
    [[ClassificationDataTool shareInstance] getPicMenueList:^(NSArray<MenueModel *> *menuePicMs, NSError *error) {
        weakSelf.menueView.menueModels = menuePicMs;
    }];
    
    
    // 加载 选项列表
    [[ClassificationDataTool shareInstance] getClassItemList:^(NSArray *classItemMs, NSError *error) {
        
        self.classItemArrays = classItemMs;
        [self.tableView reloadData];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.classItemArrays.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *classItems = self.classItemArrays[section];
    return classItems.count / 2; // 每行cell显示2个,所以要除2
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ClassItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ClassItemCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *classItems = [self.classItemArrays[indexPath.section] partitionArrayWithStart:0 Count:2];;
    cell.models = classItems[indexPath.row];
    
    return cell;
}

// cell每组Footer的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

@end
