//
//  PlayerGroupModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "PlayerFrameModel.h"
#import "AlbumInfoModel.h"

@interface PlayerGroupModel : PlayerFrameModel

@property (nonatomic, copy) NSString *groupTitle;

@property (nonatomic, copy) NSString *groupDetailTitle;

@property (nonatomic, strong) NSMutableArray <AlbumInfoModel *>*albumInfoMs;

@property (nonatomic, copy) void(^clickBlock)();

@end
