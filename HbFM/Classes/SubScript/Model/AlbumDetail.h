//
//  AlbumDetail.h
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AlbumDetailInfo;
@class AnchorInfo;
@class OtherRecommands;

@interface AlbumDetail : NSObject

@property (nonatomic, strong) AlbumDetailInfo *detail;
@property (nonatomic, strong) AnchorInfo *user;
@property (nonatomic, strong) OtherRecommands *recs;

@end
