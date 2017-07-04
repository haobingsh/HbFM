//
//  DownLoadListernAPI.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "DownLoadListernAPI.h"
#import "DownLoadListenVC.h"
#import "DownLoadDataTool.h"

@implementation DownLoadListernAPI

static DownLoadListernAPI *_shareInstance;

+ (instancetype)shareInstance {
    
    if (_shareInstance == nil) {
        _shareInstance = [[DownLoadListernAPI alloc] init];
        [_shareInstance registerNotification];
    }
    return _shareInstance;
}

- (void)registerNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadTrackInfo:) name:@"DownLoadListern_loadTrackInfo" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(presentPlayer:) name:@"DownLoadListern_presentPlayer" object:nil];
    
    
}

- (void)presentPlayer:(NSNotification *)notice {
    
    // 1. 获取通知传递过来的, 声音ID
    NSInteger trackID = [notice.object integerValue];
    
    [DownLoadDataTool shareInstance].currentTrackID = trackID;
    // 2. 执行代码块
    if (self.presentPlayerBlock) {
        self.presentPlayerBlock(trackID);
    }
    
    
}


- (void)loadTrackInfo:(NSNotification *)notice {
    
    NSInteger trackID = [notice.object integerValue];
    if (self.loadTrackBlock) {
        self.loadTrackBlock(trackID);
    }
    
}

- (UIViewController *)getDownLoadListernVC {
    
    return [DownLoadListenVC new];
    
    
}


+(void)load {
    [self shareInstance];
}


@end
