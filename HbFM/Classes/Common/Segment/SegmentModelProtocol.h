//
//  SegmentModelProtocol.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#pragma mark - 模型必须遵循的协议

@protocol SegmentModelProtocol <NSObject>

/** 选项卡的ID, 如果不设置, 默认是索引值(从0开始) */
@property (nonatomic, assign, readonly) NSInteger segID;

/** 选项卡内容 */
@property (nonatomic, copy, readonly) NSString *segContent;

@end
