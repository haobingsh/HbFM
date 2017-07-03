//
//  SubscriptAPI.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "SubscriptAPI.h"
#import "SubscribleVC.h"
#import "AlbumDetailController.h"

@implementation SubscriptAPI

static SubscriptAPI *_shareInstance;

+ (instancetype)shareInstance {
    if (_shareInstance == nil) {
        _shareInstance = [[SubscriptAPI alloc] init];
        [_shareInstance registerNotification];
    }
    return _shareInstance;
    
}

- (void)registerNotification {
    
    // 监听本模块内部的行为动作
    // 1. 跳转到播放器界面
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(presentPlayer:) name:@"SubscriptAPI_presentPlayer" object:nil];
}

- (void)presentPlayer:(NSNotification *)notice {
    
    // 1. 获取通知传递过来的, 声音ID
    NSInteger trackID = [notice.object[@"trackID"] integerValue];
    
    // 2. 执行代码块
    if (self.presentPlayerBlock) {
        self.presentPlayerBlock(trackID);
    }
    
    
}

+(void)load{
    [self shareInstance];
}

-(UIViewController *)subscriptVC {
    
    return [SubscribleVC new];
    
}

- (UIViewController *)getAlbumDetailVCWithAlbumID:(NSInteger)albumID {
    
    AlbumDetailController *vc = [[AlbumDetailController alloc] init];
    vc.albumId = [NSString stringWithFormat:@"%zd", albumID];
    return vc;
    
}


@end
