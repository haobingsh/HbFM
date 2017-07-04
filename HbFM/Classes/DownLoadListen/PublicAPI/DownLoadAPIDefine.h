//
//  DownLoadAPIDefine.h
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

// 1. 加载专辑信息
#define kLoadTrackInfo(trackID) \
[[NSNotificationCenter defaultCenter] \
postNotificationName:@"DownLoadListern_loadTrackInfo" object:trackID];

// 2. 跳转到播放器的通知定义
#define kPresentToPlayer(trackID) \
[[NSNotificationCenter defaultCenter]  \
postNotificationName:@"DownLoadListern_presentPlayer" \
object:trackID];
