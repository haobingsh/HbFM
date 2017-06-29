//
//  PlayerCommentGroupModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "PlayerFrameModel.h"
#import "CommentInfoModel.h"

@interface PlayerCommentGroupModel : PlayerFrameModel

@property (nonatomic, copy) NSString *groupTitle;

@property (nonatomic, copy) NSString *groupDetailTitle;


@property (nonatomic, strong) NSMutableArray <CommentInfoModel *>*commentInfoMs;

@property (nonatomic, strong) void(^clickBlock)();

@end
