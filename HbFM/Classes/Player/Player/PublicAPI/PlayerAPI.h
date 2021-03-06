//
//  PlayerAPI.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerAPI : NSObject

+ (instancetype)shareInstance;


- (UINavigationController *)getPlayerNavgationControllerWithTrackId:(NSInteger)trackID isCache:(BOOL)isCache;


/**
 加载音乐信息, 在播放界面展示
 */
- (void)loadTrackInfo:(NSInteger)trackID;

/**
 跳转到专辑详情的block
 */
@property (nonatomic, copy) void(^jumpAlbumDetailBlock)(NSInteger albumID, UINavigationController *currentNav);


@end
