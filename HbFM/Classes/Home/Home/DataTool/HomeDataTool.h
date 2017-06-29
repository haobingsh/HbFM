//
//  HomeDataTool.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeTabModel.h"

@interface HomeDataTool : NSObject

+ (instancetype)shareInstance;

- (void)getHomeTabs: (void(^)(NSArray <HomeTabModel *>*tabMs))resultBlock;

@end
