//
//  CommentInfoModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "PlayerFrameModel.h"

@interface CommentInfoModel : PlayerFrameModel

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger track_id;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *smallHeader;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) NSInteger createdAt;
@property (nonatomic, assign) NSInteger updatedAt;
@property (nonatomic, assign) NSInteger parentId;
@property (nonatomic, assign) NSInteger likes;

@end
