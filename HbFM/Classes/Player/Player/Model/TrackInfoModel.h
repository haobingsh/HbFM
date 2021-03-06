//
//  TrackInfoModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrackInfoModel : NSObject

@property (nonatomic, assign) NSInteger albumId;
@property (nonatomic, assign) NSInteger trackId;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, copy) NSString *playUrl64;
@property (nonatomic, copy) NSString *playUrl32;
@property (nonatomic, copy) NSString *playPathAacv164;
@property (nonatomic, copy) NSString *playPathAacv224;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger duration;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, assign) BOOL isFree;
@property (nonatomic, assign) BOOL isAuthorized;
@property (nonatomic, assign) NSInteger sampleDuration;
@property (nonatomic, assign) NSInteger priceTypeEnum;

// array
@property (nonatomic, strong) NSArray *priceType;

@property (nonatomic, assign) NSInteger categoryId;
@property (nonatomic, assign) NSInteger processState;
@property (nonatomic, copy) NSString *isPublic;

// array
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, assign) NSInteger likes;
@property (nonatomic, assign) NSInteger playtimes;
@property (nonatomic, assign) NSInteger comments;
@property (nonatomic, assign) NSInteger shares;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString *categoryName;
@property (nonatomic, assign) NSInteger bulletSwitchType;
@property (nonatomic, copy) NSString *playPathHq;
@property (nonatomic, copy) NSString *shortRichIntro;

@end
