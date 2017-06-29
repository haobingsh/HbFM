//
//  TrackRewardInfoModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RewardModel.h"

@interface TrackRewardInfoModel : NSObject

@property (nonatomic, assign) NSInteger trackID;

@property (nonatomic, copy) NSString *voiceIntro;

@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, assign) NSInteger numOfRewards;
@property (nonatomic, strong) NSArray <RewardModel *>*rewords;

@end
