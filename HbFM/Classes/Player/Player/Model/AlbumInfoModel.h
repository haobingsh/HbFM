//
//  AlbumInfoModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "PlayerFrameModel.h"

@interface AlbumInfoModel : PlayerFrameModel

@property (nonatomic, assign) NSInteger albumId;
@property (nonatomic, assign) NSInteger categoryId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *coverOrigin;
@property (nonatomic, copy) NSString *coverSmall;
@property (nonatomic, copy) NSString *coverMiddle;
@property (nonatomic, copy) NSString *coverLarge;
@property (nonatomic, copy) NSString *coverWebLarge;
@property (nonatomic, assign) NSInteger createdAt;
@property (nonatomic, assign) NSInteger updatedAt;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *tags;
@property (nonatomic, assign) NSInteger tracks;
@property (nonatomic, assign) NSInteger shares;
@property (nonatomic, assign) BOOL hasNew;
@property (nonatomic, assign) BOOL isFavorite;
@property (nonatomic, assign) NSInteger playTimes;
@property (nonatomic, assign) NSInteger playsCounts;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger serializeStatus;

@end
