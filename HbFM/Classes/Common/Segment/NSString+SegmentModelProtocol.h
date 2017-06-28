//
//  NSString+SegmentModelProtocol.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SegmentModelProtocol.h"

@interface NSString(SegmentModelProtocol) <SegmentModelProtocol>

/** 选项卡的ID, 如果不设置, 默认是索引值(从0开始) */
- (NSInteger)segID;

/** 选项卡内容 */
- (NSString *)segContent;

@end
