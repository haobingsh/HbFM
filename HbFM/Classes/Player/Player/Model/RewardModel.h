//
//  RewardModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RewardModel : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, assign) double paymentTime;
@property (nonatomic, assign) double sn;
@property (nonatomic, copy) NSString *smallLogo;

@end
