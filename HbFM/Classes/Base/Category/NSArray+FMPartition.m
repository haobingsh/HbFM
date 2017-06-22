//
//  NSArray+XMGPartition.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "NSArray+FMPartition.h"

@implementation NSArray (FMPartition)

- (NSArray *)partitionArrayWithStart:(NSInteger)start Count:(NSInteger)count
{
    
    NSMutableArray *resultArr = [NSMutableArray array];
    NSInteger max = count;
    
    NSInteger segment= (self.count + max - 1) / max;//需要分割几次
    
    for (int i = 0; i < segment; ++i) {
        NSUInteger star = (i * max) + start; //开始位置(此处跳过1个长度要加1)
        NSUInteger len = (i == (segment - 1)) ? (self.count - start - i * max) % (max + 1) : max; //结束位置(此处跳过1个长度要减1)
        
        
        NSRange range= NSMakeRange(star,len); //分割范围
        
        NSArray *temp = [self subarrayWithRange:range]; // 分割数组
        
        [resultArr addObject:temp];
    }
    
    return resultArr;
    
}


@end
