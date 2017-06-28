//
//  HomeModuleAPI.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModuleAPI : NSObject

+ (instancetype)shareInstance;


/**
 获取首页控制器
 */
@property (nonatomic, weak, readonly) UIViewController *homeVC;

/**
 跳转到专辑详情的block
 */
@property (nonatomic, copy) void(^jumpAlbumDetailBlock)(NSInteger albumID, UINavigationController *currentNav);


/**
 弹出播放器界面的block
 */
@property (nonatomic, copy) void(^presentPlayerBlock)(NSInteger trackID);

@end
