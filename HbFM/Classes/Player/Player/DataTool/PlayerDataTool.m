//
//  PlayerDataTool.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "PlayerDataTool.h"
#import "FMSessionManager.h"
#import "Sington.h"
#import "Base.h"
#import "MJExtension.h"

static NSString * const kCookie = @"kCookie";

@interface PlayerDataTool()

@property (nonatomic, strong) FMSessionManager *sessionManager;

@end

@implementation PlayerDataTool
singtonImplement(PlayerDataTool)

-(FMSessionManager *)sessionManager {
    if (_sessionManager == nil) {
        _sessionManager = [[FMSessionManager alloc] init];
    }
    return _sessionManager;
}

- (void)getPlayerDataWithAlbumId:(NSInteger)albumId trackUid: (NSInteger)trackUid  result: (void(^)(TrackInfoModel *trackM, AlbumInfoModel *albumInfoM, PlayerGroupModel *associationAlbumGroupM, UserInfoModel *userInfoM, PlayerCommentGroupModel *commentGroupM, TrackRewardInfoModel *rewardInfoM))resultBlock
{
    //    http://mobile.ximalaya.com/
    //    http://mobile.ximalaya.com/v1/track/ca/playpage/19359302?albumId=323825&device=iPhone&trackUid=32323635
    
    // http://mobile.ximalaya.com/v1/track/ca/playpage/19668798?albumId=294567&device=iPhone&trackUid=16960840
    
    NSString *url = [NSString stringWithFormat:@"%@v1/track/ca/playpage/%zd", kBaseUrl, trackUid];
    
    
    
    NSDictionary *param = @{
                            @"albumId": @(albumId),
                            @"device": @"iPhone",
                            @"trackUid": @(trackUid)
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        AlbumInfoModel *albumInfoM = [AlbumInfoModel mj_objectWithKeyValues:responseObject[@"albumInfo"]];
        
        TrackInfoModel *trackM = [TrackInfoModel mj_objectWithKeyValues:responseObject[@"trackInfo"]];
        trackM.albumId = albumInfoM.albumId;
        
        NSArray <AlbumInfoModel *>*associationAlbumMs = [AlbumInfoModel mj_objectArrayWithKeyValuesArray:responseObject[@"associationAlbumsInfo"]];
        
        PlayerGroupModel *groupM = [[PlayerGroupModel alloc] init];
        groupM.groupTitle = @"相关推荐";
        groupM.groupDetailTitle = @"查看更多推荐 >";
        groupM.albumInfoMs = [associationAlbumMs mutableCopy];
        
        
        UserInfoModel *userInfoM = [UserInfoModel mj_objectWithKeyValues:responseObject[@"userInfo"]];
        
        NSArray <CommentInfoModel *>*commentInfoMs = [CommentInfoModel mj_objectArrayWithKeyValuesArray:responseObject[@"commentInfo"][@"list"]];
        
        PlayerCommentGroupModel *commentGroupM = [[PlayerCommentGroupModel alloc] init];
        commentGroupM.groupTitle = @"听众点评";
        commentGroupM.groupDetailTitle = @"查看更多评论";
        commentGroupM.commentInfoMs = [commentInfoMs mutableCopy];
        
        [TrackRewardInfoModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"rewords": [RewardModel class]
                     };
        }];
        
        TrackRewardInfoModel *rewardInfoM = [TrackRewardInfoModel mj_objectWithKeyValues:responseObject[@"trackRewardInfo"]];
        rewardInfoM.trackID = trackM.trackId;
        // 额外属性赋值
        rewardInfoM.voiceIntro = trackM.shortRichIntro;
        
        if (resultBlock != nil) {
            resultBlock(trackM, albumInfoM, groupM, userInfoM, commentGroupM, rewardInfoM);
        }
        
    }];
    
    
    
}


- (void)getRecommendMsWithAlbumId:(NSInteger)albumId result: (void(^)(NSArray <AlbumInfoModel *>*albumInfoMs))result
{
    
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kAlbumUrl, @"rec-association/recommend/album/by_album"];
    
    
    NSDictionary *param = @{
                            @"albumId": @(albumId),
                            @"device": @"iPhone",
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        
        NSArray <AlbumInfoModel *>*albumMs = [AlbumInfoModel mj_objectArrayWithKeyValuesArray:responseObject[@"albums"]];
        
        if (result != nil) {
            result(albumMs);
        }
        
    }];
    
}

- (void)getCommentMsWithTrackId:(NSInteger)trackId retuslt: (void(^)(NSArray <CommentInfoModel *>*commentMs))result {
    
    
    //       http://mobile.ximalaya.com/mobile/track/comment?device=iPhone&pageId=1&pageSize=30&trackId=19380085
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/track/comment"];
    
    
    NSDictionary *param = @{
                            @"trackId": @(trackId),
                            @"device": @"iPhone",
                            @"pageId": @(1),
                            @"pageSize": @(66)
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        
        NSArray <CommentInfoModel *>*commentMs = [CommentInfoModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        if (result != nil) {
            result(commentMs);
        }
        
    }];
    
}

- (void)getTrackDetailWithTrackID: (NSInteger)trackID result:(void(^)(AlubmnDetailModel *alubmnDetailM))resultBlock
{
    
    // http://mobile.ximalaya.com/v1/track/extendInfo?device=iPhone&trackId=19668798
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"v1/track/extendInfo"];
    
    
    NSDictionary *param = @{
                            @"trackId": @(trackID),
                            @"device": @"iPhone",
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        AlubmnDetailModel *alubmnDetailM = [AlubmnDetailModel mj_objectWithKeyValues:responseObject];
        
        if (resultBlock != nil) {
            resultBlock(alubmnDetailM);
        }
        
    }];
    
}


- (void)getRewardList:(void(^)())resultBlock {
    
    //
    //    NSData * cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    //    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    //    [defaults setObject: cookiesData forKey:kCookie];
    //    [defaults synchronize];
    
    
    //    http://hybrid.ximalaya.com/ting-shang-mobile-web/1/user/rewardSelect?app=iting&device=iPhone&impl=com.gemd.iting&payeeId=10260025&payerId=12593123&trackId=19994417&version=5.4.21
    
    // domain=.ximalaya.com; path=/; channel=ios-b1; 1&_device=iPhone&5C60B916-A283-4DD3-98B1-8C42A8A889CF&5.4.21; impl=com.gemd.iting; NSUP=42E2BD7E%2C41B914ED%2C1471577797525; XUM=5C60B916-A283-4DD3-98B1-8C42A8A889CF; c-oper=%E6%9C%AA%E7%9F%A5; net-mode=WIFI; res=750%2C1334; 1&_token=12593123&7bd382a40170a046410a1a102e06d38340af; idfa=5C60B916-A283-4DD3-98B1-8C42A8A889CF
    
    
    //    NSArray * cookies = [NSKeyedUnarchiver unarchiveObjectWithData: [[NSUserDefaults standardUserDefaults] objectForKey:kCookie]];
    NSHTTPCookieStorage * cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSHTTPCookie *customCookie = [NSHTTPCookie cookieWithProperties:@{
                                                                      @"domain": @".ximalaya.com",
                                                                      @"path":@"/",
                                                                      @"channel":@"ios-b1",
                                                                      @"1&_device":@"iPhone&5C60B916-A283-4DD3-98B1-8C42A8A889CF&5.4.21",
                                                                      @"impl":@"com.gemd.iting",
                                                                      @"NSUP":@"42E2BD7E%2C41B914ED%2C1471577797525",
                                                                      @"XUM":@"5C60B916-A283-4DD3-98B1-8C42A8A889CF",
                                                                      @"c-oper":@"%E6%9C%AA%E7%9F%A5",
                                                                      @"net-mode":@"WIFI",
                                                                      @"res":@"750%2C1334",
                                                                      @"1&_token":@"12593123&7bd382a40170a046410a1a102e06d38340af",
                                                                      @"idfa":@"5C60B916-A283-4DD3-98B1-8C42A8A889CF"
                                                                      }];
    
    
    [cookieStorage setCookie: customCookie];
    
    
    
    //      http://hybrid.ximalaya.com/ting-shang-mobile-web/1/user/rewardSelect?app=iting&device=iPhone&impl=com.gemd.iting&payeeId=10260025&payerId=12593123&trackId=19994417&version=5.4.21
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kHybridUrl, @"ting-shang-mobile-web/1/user/rewardSelect"];
    
    
    NSDictionary *param = @{
                            @"app": @"iting",
                            @"device": @"iPhone",
                            @"impl": @"com.gemd.iting",
                            @"payeeId":@"10260025",
                            @"payerId": @"12593123",
                            @"trackId": @"19994417",
                            @"version": @"5.4.21"
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        //        XMGLog(@"%@", responseObject)
        
    }];
    
    
    
}

- (void)getTrackMsWithAlbumId: (NSInteger)albumId trackId:(NSInteger)trackId result:(void(^)(NSMutableArray <TrackInfoModel *>*))resultBlock {
    
    
    //    http://mobile.ximalaya.com/mobile/playlist/album/new?albumId=2716928&asc=true&device=iPhone&trackId=19039103
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/playlist/album/new"];
    
    
    NSDictionary *param = @{
                            @"albumId": @(albumId),
                            @"asc": @"true",
                            @"device": @"iPhone",
                            @"trackId": @(trackId)
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        NSMutableArray <TrackInfoModel *> *albumMs = [TrackInfoModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        
        if (resultBlock != nil) {
            resultBlock(albumMs);
        }
        
    }];
    
    
    
    
}


- (void)getDanMuMsWithTrackId:(NSInteger)trackId result:(void(^)(NSMutableArray <DanmuModel *>*danmuMs, BOOL isNewData))resultBlock {
    
    static NSInteger sec = 0;
    static NSInteger lastTrackId = 0;
    BOOL isNewData = NO;
    if (lastTrackId != trackId) {
        sec = 0;
        isNewData = YES;
        lastTrackId = trackId;
    }
    
    
    //     http://mobile.ximalaya.com/comment-mobile/bullet?device=iPhone&second=80&trackId=20128255
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"comment-mobile/bullet"];
    
    
    NSDictionary *param = @{
                            @"device": @"iPhone",
                            @"second": @(sec),
                            @"trackId": @(trackId)
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        NSMutableArray <DanmuModel *> *danmuMs = [DanmuModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"comments"]];
        
        sec = [responseObject[@"data"][@"second"] integerValue];
        
        if (resultBlock != nil) {
            
            [danmuMs sortUsingComparator:^NSComparisonResult(DanmuModel *obj1, DanmuModel *obj2) {
                if (obj1.startTime < obj2.startTime) {
                    return NSOrderedAscending;
                }
                return NSOrderedDescending;
                
            }];
            
            
            resultBlock(danmuMs, isNewData);
        }
        
    }];
    
    
    
    
}



@end
