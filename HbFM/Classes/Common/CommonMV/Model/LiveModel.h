//
//  LiveModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LiveModel : NSObject

@property (nonatomic, copy)  NSString *chatId;
@property (nonatomic, copy, getter=adImgURL)  NSString *coverPath;
@property (nonatomic, copy)  NSString *endTs;
@property (nonatomic, copy)  NSString *id;
@property (nonatomic, copy)  NSString *name;
@property (nonatomic, copy)  NSString *onlineCount;
@property (nonatomic, copy)  NSString *playCount;
@property (nonatomic, copy)  NSString *scheduleId;
@property (nonatomic, copy)  NSString *shortDescription;
@property (nonatomic, copy)  NSString *startTs;
@property (nonatomic, copy)  NSString *status;

@property (nonatomic, copy) void(^clickBlock)();

@end
