//
//  DownLoadListenVC.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "DownLoadListenVC.h"
#import "SegmentBar.h"
#import "AlbumTVC.h"
#import "VoiceTVC.h"
#import "DownLoadingTVC.h"
#import "Base.h"
#import "FMConst.h"
#import "UIView+FMLayout.h"
#import "FMDeviceMessage.h"
#import "FMCacheTool.h"

@interface DownLoadListenVC ()<UIScrollViewDelegate, SegmentBarDelegate>

@property (nonatomic, strong) SegmentBar *segmentBar;
@property (nonatomic, weak) UIScrollView *contentScrollView;

@property (nonatomic, weak) UILabel *noticeLabel;

@end

@implementation DownLoadListenVC

-(SegmentBar *)segmentBar
{
    if (!_segmentBar) {
        _segmentBar = [SegmentBar segmentBarWithConfig:[SegmentConfig defaultConfig]];
        _segmentBar.delegate = self;
    }
    return _segmentBar;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpInit];
    
    self.navigationItem.titleView = self.segmentBar;
    self.segmentBar.segmentMs = @[@"专辑", @"声音", @"下载中"];
    self.segmentBar.selectedIndex = 0;
    
    // 监听下载状态改变的通知
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkMemory) name:kDownLoadStateChangeNotification object:nil];
    
}


-(void)dealloc
{
    // 移除通知监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setUpInit {
    
    self.view.backgroundColor = FMColor(225, 225, 225);
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
    // 0. 添加子控制器
    [self addChildViewControllers];
    
    // 1. 添加占用内存横幅
    UILabel *noticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kNavigationBarMaxY, kScreenWidth, 20)];
    self.noticeLabel = noticeLabel;
    noticeLabel.backgroundColor = [UIColor grayColor];
    noticeLabel.textAlignment = NSTextAlignmentCenter;
    noticeLabel.font = [UIFont systemFontOfSize:12];
    noticeLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:noticeLabel];
    
    
    // 2. 添加内容视图
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kNavigationBarMaxY + 20, kScreenWidth, kScreenHeight - (kNavigationBarMaxY + 20 + kTabbarHeight))];
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    self.contentScrollView = scrollView;
    self.contentScrollView.contentSize = CGSizeMake(self.contentScrollView.width * self.childViewControllers.count, 0);
    [self.view addSubview:scrollView];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self checkMemory];
}

- (void)checkMemory {
    
    // 剩余空间
    NSString *freeSpace = [FMDeviceMessage freeDiskSpaceInBytes];
    
    // 已用空间
    // kDownLoadPath
    NSString *useSpace = [FMCacheTool getSizeWithPath:NSHomeDirectory()];
    
    
    self.noticeLabel.text = [NSString stringWithFormat:@"已占用空间%@, 可用空间%@", useSpace, freeSpace];
    
}



- (void)addChildViewControllers {
    
    // 如果设置view的backgroundColor会提前出发viewDidLoad方法
    AlbumTVC *albumTVC = [[AlbumTVC alloc] init];
    [self addChildViewController:albumTVC];
    
    VoiceTVC *voiceTVC = [[VoiceTVC alloc] init];
    [self addChildViewController:voiceTVC];
    
    DownLoadingTVC *downLoadTVC = [[DownLoadingTVC alloc] init];
    [self addChildViewController:downLoadTVC];
    
    
}


- (void)showControllerView:(NSInteger)index {
    
    UIView *view = self.childViewControllers[index].view;
    CGFloat contentViewW = self.contentScrollView.width;
    view.frame = CGRectMake(contentViewW * index, 0, contentViewW, self.contentScrollView.height);
    [self.contentScrollView addSubview:view];
    [self.contentScrollView setContentOffset:CGPointMake(contentViewW * index, 0) animated:YES];
    
    
}


- (void)segmentBarDidSelectIndex: (NSInteger)toIndex fromIndex: (NSInteger)fromIndex
{
    [self showControllerView:toIndex];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSInteger page = scrollView.contentOffset.x / scrollView.width;
    self.segmentBar.selectedIndex = page;
    
}

@end
