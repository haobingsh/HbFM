//
//  Tracks.h
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XMGTrack;

/*
 "pageId": 1,
 "pageSize": 20,
 "maxPageId": 20,
 "totalCount": 384
 */
@interface Tracks : NSObject

@property (nonatomic, strong) NSArray <XMGTrack *>*list;
@property (nonatomic, copy) NSString *pageId;
@property (nonatomic, copy) NSString *pageSize;
@property (nonatomic, copy) NSString *maxPageId;
@property (nonatomic, copy) NSString *totalCount;

@end
