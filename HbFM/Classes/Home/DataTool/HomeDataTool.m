//
//  HomeDataTool.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "HomeDataTool.h"
#import "FMSessionManager.h"
#import "MJExtension.h"
#import "Sington.h"
#import "Base.h"

@interface HomeDataTool()

@property (nonatomic, strong) FMSessionManager *manager;

@end

@implementation HomeDataTool

singtonImplement(HomeDataTool);


- (FMSessionManager *)manager {
    if (!_manager) {
        _manager = [[FMSessionManager alloc] init];
    }
    return _manager;
}


- (void)getHomeTabs: (void(^)(NSArray <HomeTabModel *>*tabMs))resultBlock {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v1/tabs"];
    NSDictionary *param = @{
                            @"device": @"iPhone"
                            };
    
    [self.manager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        NSArray <NSDictionary *>*dicArray = (NSArray <NSDictionary *>*)responseObject[@"tabs"][@"list"];
        NSMutableArray *menueItems = [NSMutableArray array];
        for (NSDictionary *dic in dicArray) {
            
            [menueItems addObject:dic[@"title"]];
            
        }
        resultBlock(menueItems);
        
    }];
    
    
}


@end
