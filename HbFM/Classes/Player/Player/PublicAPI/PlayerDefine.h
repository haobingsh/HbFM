//
//  PlayerDefine.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

// 1. 跳转到专辑详情的通知定义
#define kJumpToAlbumDetail(albumID,currentNav) \
[[NSNotificationCenter defaultCenter]  \
postNotificationName:@"PlayerAPI_jumpToAbumDetail" \
object:@{ \
@"albumID": albumID, \
@"currentNav": currentNav \
}];
