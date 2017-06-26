//
//  NSString+SegmentModelProtocol.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "NSString+SegmentModelProtocol.h"

@implementation NSString (SegmentModelProtocol)

- (NSInteger)segID {
    return -1;
}

- (NSString *)segContent {
    return self;
}

@end
