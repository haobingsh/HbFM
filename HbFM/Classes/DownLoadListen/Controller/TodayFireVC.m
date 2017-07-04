//
//  TodayFireVC.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "TodayFireVC.h"
#import "SegmentBar.h"

#import "DownLoadDataTool.h"
#import "TodayFireVoiceListTVC.h"
#import "UIView+FMLayout.h"
#import "FMConst.h"
#import "Base.h"

@interface TodayFireVC ()<UIScrollViewDelegate, SegmentBarDelegate>

@property (nonatomic, strong) SegmentBar *segmentBar;
@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic, strong) NSArray<CategoryModel *> *categoryMs;

@end

@implementation TodayFireVC

-(SegmentBar *)segmentBar
{
    if (!_segmentBar) {
        SegmentConfig *config = [SegmentConfig defaultConfig];
        config.isShowMore = YES;
        _segmentBar = [SegmentBar segmentBarWithConfig:config];
        _segmentBar.y = kNavigationBarMaxY;
        _segmentBar.backgroundColor = [UIColor whiteColor];
        _segmentBar.delegate = self;
    }
    return _segmentBar;
}

-(UIScrollView *)contentScrollView
{
    if (!_contentScrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kNavigationBarMaxY + self.segmentBar.height, kScreenWidth, kScreenHeight - (kNavigationBarMaxY + self.segmentBar.height))];
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        scrollView.contentSize = CGSizeMake(scrollView.width * self.childViewControllers.count, 0);
        _contentScrollView = scrollView;
    }
    return _contentScrollView;
}

-(void)setCategoryMs:(NSArray<CategoryModel *> *)categoryMs
{
    _categoryMs = categoryMs;
    [self setUpWithItems:[categoryMs valueForKeyPath:@"name"]];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"今日最火";
    self.view.tag = 666;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = kCommonColor;
    
    // 2. 添加内容视图
    [self.view addSubview:self.contentScrollView];
    
    // 1. 设置菜单栏
    [self.view addSubview:self.segmentBar];
    
    
    
    // 3. 加载数据
    kWeakSelf
    [[DownLoadDataTool shareInstance] getTodayFireShareAndCategoryData:^(ShareModel *shareM, NSArray<CategoryModel *> *categoryMs) {
        weakSelf.categoryMs = categoryMs;
    }];
}


- (void)setUpWithItems: (NSArray <NSString *>*)items {
    
    // 0.添加子控制器
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    for (int i = 0; i < items.count; i++) {
        TodayFireVoiceListTVC *vc = [[TodayFireVoiceListTVC alloc] init];
        vc.view.backgroundColor = FMRandomColor;
        [self addChildViewController:vc];
    }
    
    // 1. 设置菜单项展示
    self.segmentBar.segmentMs = items;
    
    self.contentScrollView.contentSize = CGSizeMake(self.contentScrollView.width * items.count, 0);
    
    self.segmentBar.selectedIndex = 0;
}

- (void)showControllerView:(NSInteger)index {
    
    TodayFireVoiceListTVC *cvc = self.childViewControllers[index];
    cvc.loadKey = self.categoryMs[index].key;
    UIView *view = cvc.view;
    CGFloat contentViewW = self.contentScrollView.width;
    view.frame = CGRectMake(contentViewW * index, 0, contentViewW, self.contentScrollView.height);
    [self.contentScrollView addSubview:view];
    [self.contentScrollView setContentOffset:CGPointMake(contentViewW * index, 0) animated:YES];
    
}



- (void)segmentBarDidSelectIndex:(NSInteger)selectedIndex fromIndex:(NSInteger)fromIndex
{
    [self showControllerView:selectedIndex];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSInteger page = scrollView.contentOffset.x / scrollView.width;
    self.segmentBar.selectedIndex = page;
    
}

@end
