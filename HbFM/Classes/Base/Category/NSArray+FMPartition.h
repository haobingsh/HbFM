//
//  NSArray+XMGPartition.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (FMPartition)

/**
 *  将一个数组切割成多个数组
 *
 *  @param start 从第几个元素开始分割
 *  @param count 每个数组最大个数
 *
 *  @return 切割好的数组
 */
- (NSArray *)partitionArrayWithStart:(NSInteger)start Count:(NSInteger)count;

@end
