//
//  SubcriptDefine.h
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

// 1. 跳转到播放器的通知定义
#define kPresentToPlayer(trackID) \
[[NSNotificationCenter defaultCenter]  \
postNotificationName:@"SubscriptAPI_presentPlayer" \
object:@{ \
@"trackID": trackID, \
}];
