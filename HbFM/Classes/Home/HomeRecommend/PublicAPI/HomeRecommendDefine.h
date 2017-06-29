//
//  HomeRecommendDefine.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

// 1. 跳转到专辑详情的通知定义
#define kJumpToAlbumDetail(albumID,currentNav) \
[[NSNotificationCenter defaultCenter]  \
postNotificationName:@"HomeRecommendAPI_jumpToAbumDetail" \
object:@{ \
@"albumID": albumID, \
@"currentNav": currentNav \
}];


// 2. 跳转到播放器的通知定义
#define kPresentToPlayer(trackID) \
[[NSNotificationCenter defaultCenter]  \
postNotificationName:@"HomeRecommendAPI_presentPlayer" \
object:@{ \
@"trackID": trackID, \
}];
