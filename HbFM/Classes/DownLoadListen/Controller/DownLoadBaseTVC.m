//
//  DownLoadBaseTVC.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "DownLoadBaseTVC.h"
#import "NoDownLoadView.h"
#import "TodayFireVC.h"
#import "Base.h"
#import "DownLoadService.h"

@interface DownLoadBaseTVC ()

@property (nonatomic, strong) NoDownLoadView *noDataView;

@end

@implementation DownLoadBaseTVC

-(void)setShowNoDataPane:(BOOL)showNoDataPane
{
    _showNoDataPane = showNoDataPane;
    
    self.noDataView.hidden = !_showNoDataPane;
}

-(NoDownLoadView *)noDataView
{
    if (_noDataView == nil) {
        if ([NSStringFromClass([self class]) isEqualToString:@"DownLoadingTVC"]) {
            _noDataView = [NoDownLoadView noDownLoadViewWithType:NoDownLoadViewNoDownLoading];
        }else
        {
            _noDataView = [NoDownLoadView noDownLoadViewWithType:NoDownLoadViewNoDownLoaded];
        }
        
        [self.tableView addSubview:_noDataView];
    }
    return _noDataView;
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.noDataView.center = CGPointMake(kScreenWidth * 0.5, kScreenHeight * 0.3);
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.backgroundColor = kCommonColor;
    self.tableView.tableFooterView = [UIView new];
    
    kWeakSelf
    self.noDataView.clickBlock = ^{
        //        XMGLog(@"跳转到查找界面")
        TodayFireVC *todayF = [[TodayFireVC alloc] init];
        [weakSelf.navigationController pushViewController:todayF animated:YES];
    };
    
    // 监听下载状态改变的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadData) name:kDownLoadStateChangeNotification object:nil];
    
}

- (void)loadData {
    
}

-(void)dealloc
{
    // 移除通知监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
