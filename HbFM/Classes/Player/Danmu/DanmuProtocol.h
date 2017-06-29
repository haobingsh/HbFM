//
//  DanmuProtocol.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

@protocol DanmuProtocol <NSObject>

/** 头像地址 */
@property (nonatomic, copy) NSString *headerIconUrl;

/** 弹幕内容, 可展示富文本 */
@property (nonatomic, copy) NSMutableAttributedString *attributeContent;


/** 开始时间 */
@property (nonatomic, assign) NSTimeInterval beginTime;

/** 存活时间 */
@property (nonatomic, assign, readonly) NSTimeInterval liveTime;

@end
