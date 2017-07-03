//
//  SubscribleDataTool.h
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Recommends.h"
#import "Subscribe.h"

#import "AlbumMenu.h"
#import "Album.h"
#import "Tracks.h"
#import "Track.h"

#import "AlbumDetail.h"
#import "OtherRecommands.h"
#import "DownLoadModel.h"

@interface SubscribleDataTool : NSObject

+ (instancetype)shareInstance;

/**
 *  推荐
 */
- (void)getRecommandList:(void(^)(NSArray <NSString *>*recommendList, NSError *error))result ;

/**
 *  订阅
 */
- (void)getSubscribleList:(void(^)(NSArray <NSString *>*subscribleList, NSError *error))result ;

/**
 *  专辑详情 - 详情
 */
- (void)getAlbumDetailWithAlbumId:(NSString *)albumId result:(void(^)(AlbumDetail *albumDetail, NSError *error))result;

/**
 *  专辑详情 - 节目
 */
- (void)getAlbumMenuWithAlbumId:(NSString *)albumId result:(void(^)(AlbumMenu *albumMenu, NSError *error))result;

/**
 专辑节目列表
 
 @param albumId <#albumId description#>
 @param result <#result description#>
 */
- (void)getAlbumTrackListWithAlbumId:(NSString *)albumId result:(void(^)(Tracks *tracks, NSError *error))result;
/**
 *  批量下载
 */
-(void)getDownLoadListAlbumId:(NSString *)albumId position:(NSInteger)position result:(void(^)(NSArray <NSString *>*downLoadList, NSError *error))result ;

@end
