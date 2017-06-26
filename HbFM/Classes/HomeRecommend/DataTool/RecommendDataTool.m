//
//  RecommendDataTool.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "RecommendDataTool.h"
#import "FMSessionManager.h"
#import "Base.h"
#import "MJExtension.h"
#import "Sington.h"
#import "AdPicModel.h"
#import "MenueModel.h"

@interface RecommendDataTool()

@property (nonatomic, strong) FMSessionManager *sessionManager;

@end

@implementation RecommendDataTool

singtonImplement(RecommendDataTool)



-(FMSessionManager *)sessionManager {
    if (_sessionManager == nil) {
        _sessionManager = [[FMSessionManager alloc] init];
    }
    return _sessionManager;
}


- (void)getDiscoverMenueList:(void(^)(NSArray <NSString *>*menueList, NSError *error))result {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v1/tabs"];
    NSDictionary *param = @{
                            @"device": @"iPhone"
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        NSLog(@"%@", responseObject[@"tabs"][@"list"]);
        
        NSArray <NSDictionary *>*dicArray = (NSArray <NSDictionary *>*)responseObject[@"tabs"][@"list"];
        NSMutableArray *menueItems = [NSMutableArray array];
        for (NSDictionary *dic in dicArray) {
            
            [menueItems addObject:dic[@"title"]];
            
        }
        result(menueItems, error);
        
    }];
    
    
}


- (void)getAdList:(void(^)(NSArray <XMGAdPicModel *>*adMs, NSError *error))result {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v4/recommends"];
    NSDictionary *param = @{
                            @"channel": @"ios-b1",
                            @"device": @"iPhone",
                            @"includeActivity": @(YES),
                            @"includeSpecial": @(YES),
                            @"scale": @2,
                            @"version": @"5.4.21"
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        NSArray *focusImageMs = [FocusImageModel mj_objectArrayWithKeyValuesArray:responseObject[@"focusImages"][@"list"]];
        
        NSMutableArray *adPicMs = [NSMutableArray array];
        for (FocusImageModel *focusImageM in focusImageMs) {
            AdPicModel *adPicM = [[AdPicModel alloc] init];
            adPicM.focusImageM = focusImageM;
            [adPicMs addObject:adPicM];
        }
        
        
        result(adPicMs, error);
        
        
    }];
}


- (void)getEditorRecommendAlbums:(void(^)(GroupModel *groupM, NSError *error))result
{
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v4/recommends"];
    NSDictionary *param = @{
                            @"channel": @"ios-b1",
                            @"device": @"iPhone",
                            @"includeActivity": @(YES),
                            @"includeSpecial": @(YES),
                            @"scale": @2,
                            @"version": @"5.4.21"
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        
        [GroupModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"list": [ItemInCellModel class]
                     };
        }];
        
        
        NSDictionary *dic = responseObject[@"editorRecommendAlbums"];
        GroupModel *groupM = [GroupModel mj_objectWithKeyValues:dic];
        groupM.cellType = CellTypeList3;
        result(groupM, error);
        
        
    }];
    
}


- (void)getPicMenueList:(void(^)(NSArray <MenueModel *>*menuePicMs, NSError *error))result {
    
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v2/recommend/hotAndGuess"];
    NSDictionary *param = @{
                            @"device": @"iPhone",
                            @"version": @"5.4.21"
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        NSArray *menuePicMs = [MenueModel mj_objectArrayWithKeyValuesArray:responseObject[@"discoveryColumns"][@"list"]];
        
        result(menuePicMs, error);
        
        
    }];
    
    
    
}


- (void)getLiveMs:(void(^)(GroupModel *groupM, NSError *error))result {
    
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kLiveUrl, @"live-activity-web/v3/activity/recommend"];
    
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:nil resultBlock:^(id responseObject, NSError *error) {
        
        NSLog(@"%@", responseObject);
        
        NSArray *liveMs = [LiveModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        
        NSLog(@"%@", liveMs);
        GroupModel *groupM = [[GroupModel alloc] init];
        groupM.cellType = CellTypeList1;
        groupM.title = @"现场直播";
        groupM.hasMore = true;
        
        groupM.liveMs = liveMs;
        
        
        result(groupM, error);
        
        
    }];
    
    
    
}

- (void)getSpecialColumnMs:(void(^)(GroupModel *groupM, NSError *error))result
{
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v4/recommends"];
    NSDictionary *param = @{
                            @"channel": @"ios-b1",
                            @"device": @"iPhone",
                            @"includeActivity": @(YES),
                            @"includeSpecial": @(YES),
                            @"scale": @2,
                            @"version": @"5.4.21"
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        
        [GroupModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"list": [SpecialColumnModel class]
                     };
        }];
        
        
        NSDictionary *dic = responseObject[@"specialColumn"];
        GroupModel *groupM = [GroupModel mj_objectWithKeyValues:dic];
        groupM.cellType = CellTypeList2;
        
        result(groupM, error);
        
        
    }];
    
    
    
    
}

- (void)getTuiGuangMs:(void(^)(GroupModel *groupM, NSError *error))result
{
    
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kAdUrl, @"/ting/feed"];
    
    NSDictionary *param = @{
                            @"appid": @"0",
                            @"device": @"iPhone",
                            @"name": @"find_native",
                            @"network": @"WIFI",
                            @"operator": @3,
                            @"scale": @2,
                            @"version": @"5.4.21"
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        NSLog(@"%@", responseObject);
        [TuiguangModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return  @{
                      @"Description": @"description",
                      @"Auto" : @"auto"
                      };
        }];
        
        NSArray *tuiguangMs = [TuiguangModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        
        GroupModel *groupM = [[GroupModel alloc] init];
        groupM.cellType = CellTypeList1;
        groupM.title = @"推广";
        groupM.hasMore = true;
        
        groupM.tuiguangMs = tuiguangMs;
        
        
        result(groupM, error);
        
        
    }];
    
    
}

- (void)getCityAlbums:(void(^)(GroupModel *groupM, NSError *error))result
{
    
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v2/recommend/hotAndGuess"];
    NSDictionary *param = @{
                            @"code": @"43_440000_4401",
                            @"device": @"iPhone",
                            @"version": @"5.4.21"
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        
        
        [GroupModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"list": [ItemInCellModel class]
                     };
        }];
        
        GroupModel *groupM = [GroupModel mj_objectWithKeyValues:responseObject[@"cityColumn"]];
        
        groupM.cellType = CellTypeList3;
        result(groupM, error);
        
        
    }];
    
    
}

- (void)getHotRecommendsAlbums:(void(^)(NSArray <GroupModel *> *groupMs, NSError *error))result
{
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v2/recommend/hotAndGuess"];
    NSDictionary *param = @{
                            @"code": @"43_440000_4401",
                            @"device": @"iPhone",
                            @"version": @"5.4.21"
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        
        
        [GroupModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"list": [ItemInCellModel class]
                     };
        }];
        
        
        NSArray *groupMs = [GroupModel mj_objectArrayWithKeyValuesArray:responseObject[@"hotRecommends"][@"list"]];
        
        [groupMs enumerateObjectsUsingBlock:^(GroupModel *groupM, NSUInteger idx, BOOL * _Nonnull stop) {
            groupM.sortID = 10 + idx;
            groupM.cellType = CellTypeList3;
        }];
        
        
        result(groupMs, error);
        
        
    }];
}

- (void)getRecommendEditorList:(void (^)(NSArray<NominateEditorModel *>*editorMs, NSError *error))result
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v1/recommend/editor"];
    
    NSDictionary *param = @{
                            @"device": @"iPhone",
                            @"pageId": @"1",
                            @"pageSize": @"20"
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:urlString parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        NSArray *editorMs = [NominateEditorModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        result(editorMs, error);
        
    }];
}


@end
