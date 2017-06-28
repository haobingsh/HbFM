//
//  HomeTabModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SegmentModelProtocol;
@interface HomeTabModel : NSObject<SegmentModelProtocol>

/** 选项卡的ID, 如果不设置, 默认是索引值(从0开始) */
@property (nonatomic, assign) NSInteger segID;

/**
 内容类型
 */
@property (nonatomic, copy) NSString *contentType;

/**
 标题
 */
@property (nonatomic, copy, getter=segContent) NSString *title;


@end
