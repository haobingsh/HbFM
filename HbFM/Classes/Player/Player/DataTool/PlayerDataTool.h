//
//  PlayerDataTool.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrackInfoModel.h"
#import "AlbumInfoModel.h"
#import "UserInfoModel.h"
#import "CommentInfoModel.h"
#import "TrackRewardInfoModel.h"

#import "PlayerGroupModel.h"
#import "PlayerCommentGroupModel.h"
#import "AlubmnDetailModel.h"
#import "DanmuModel.h"

@interface PlayerDataTool : NSObject

+ (instancetype)shareInstance;

- (void)getPlayerDataWithAlbumId:(NSInteger)albumId trackUid: (NSInteger)trackUid  result: (void(^)(TrackInfoModel *trackM, AlbumInfoModel *albumInfoM, PlayerGroupModel *associationAlbumGroupM, UserInfoModel *userInfoM, PlayerCommentGroupModel *commentGroupM, TrackRewardInfoModel *rewardInfoM))resultBlock;


- (void)getRecommendMsWithAlbumId:(NSInteger)albumId result: (void(^)(NSArray <AlbumInfoModel *>*albumInfoMs))result;


- (void)getCommentMsWithTrackId:(NSInteger)trackId retuslt: (void(^)(NSArray <CommentInfoModel *>*commentMs))result;


- (void)getTrackDetailWithTrackID: (NSInteger)trackID result:(void(^)(AlubmnDetailModel *alubmnDetailM))resultBlock;


- (void)getRewardList:(void(^)())resultBlock;


- (void)getTrackMsWithAlbumId: (NSInteger)albumId trackId:(NSInteger)trackId result:(void(^)(NSMutableArray <TrackInfoModel *>*))resultBlock;

/**
 *  获取弹幕模型
 *
 */
- (void)getDanMuMsWithTrackId:(NSInteger)trackId result:(void(^)(NSMutableArray <DanmuModel *>*danmuMs, BOOL isNewData))resultBlock;

@end
