//
//  OtherRecommands.h
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OtherRecommand;
/*
 "pageId": 1,
 "pageSize": 3,
 "maxPageId": 4,
 "totalCount": 10
 */
@interface OtherRecommands : NSObject

@property(nonatomic, strong)NSArray <OtherRecommand *>* list;
@property(nonatomic, assign)NSInteger pageId;
@property(nonatomic, assign)NSInteger pageSize;
@property(nonatomic, assign)NSInteger maxPageId;
@property(nonatomic, assign)NSInteger totalCount;

@end
