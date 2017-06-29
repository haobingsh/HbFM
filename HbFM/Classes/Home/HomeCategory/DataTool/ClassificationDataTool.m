//
//  ClassificationDataTool.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "ClassificationDataTool.h"
#import "Base.h"
#import "FMSessionManager.h"
#import "MJExtension.h"
#import "NSArray+FMPartition.h"
#import "Sington.h"

#import "MenueModel.h"
#import "AdPicModel.h"
#import "ClassItemModel.h"

@interface ClassificationDataTool()

@property (nonatomic, strong) FMSessionManager *sessionManager;

@end

@implementation ClassificationDataTool

singtonImplement(ClassificationDataTool)

-(FMSessionManager *)sessionManager {
    if (_sessionManager == nil) {
        _sessionManager = [[FMSessionManager alloc] init];
    }
    return _sessionManager;
}

- (void)getPicMenueList:(void(^)(NSArray <MenueModel *>*menuePicMs, NSError *error))result
{
    
    //   http://mobile.ximalaya.com/mobile/discovery/v2/categories?channel=ios-b1&device=iPhone&picVersion=13&scale=2&version=5.4.21
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v2/categories"];
    NSDictionary *param = @{
                            @"channel": @"ios-b1",
                            @"device": @"iPhone",
                            @"version": @"5.4.21",
                            @"picVersion": @13,
                            @"scale": @2
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        NSArray *menuePicMs = [MenueModel mj_objectArrayWithKeyValuesArray:responseObject[@"discoveryColumns"][@"list"]];
        
        result(menuePicMs, error);
        
        
    }];
    
}

- (void)getAdList:(void(^)(NSArray <AdPicModel *>*adMs, NSError *error))result
{
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v2/categories"];
    NSDictionary *param = @{
                            
                            @"channel": @"ios-b1",
                            @"device": @"iPhone",
                            @"version": @"5.4.21",
                            @"picVersion": @13,
                            @"scale": @2
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        NSArray *classItemMs = [ClassItemModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        NSMutableArray *adPicMs = [NSMutableArray array];
        //        for (XMGClassItemModel *classItemM in classItemMs) {
        
        //            if (classItemM.categoryType == 1 ) {
        AdPicModel *adPicM = [[AdPicModel alloc] init];
        adPicM.classItemM = [classItemMs firstObject];
        [adPicMs addObject:adPicM];
        //            }
        
        //        }
        
        
        result(adPicMs, error);
        
        
        
    }];
    
}

- (void)getClassItemList:(void(^)(NSArray *classItemMs, NSError *error))result
{
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v2/categories"];
    NSDictionary *param = @{
                            
                            @"channel": @"ios-b1",
                            @"device": @"iPhone",
                            @"version": @"5.4.21",
                            @"picVersion": @13,
                            @"scale": @2
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        NSArray *classItemMs = [ClassItemModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 将一个大数组按照指定的个数切成小数组
        NSArray *resultMs = [classItemMs partitionArrayWithStart:1 Count:6];
        
        result(resultMs, error);
    }];
}


@end
