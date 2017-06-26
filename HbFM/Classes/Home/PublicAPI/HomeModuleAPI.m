//
//  HomeModuleAPI.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "HomeModuleAPI.h"
#import "HomeRecommendAPI.h"
#import "HomeVC.h"

@implementation HomeModuleAPI

static HomeModuleAPI *_shareInstance;
+ (instancetype)shareInstance {
    if (_shareInstance == nil) {
        _shareInstance = [[HomeModuleAPI alloc] init];
    }
    return _shareInstance;
}

- (UIViewController *)homeVC {
    return [[HomeVC alloc] init];
}


- (void)setJumpAlbumDetailBlock:(void (^)(NSInteger, UINavigationController *))jumpAlbumDetailBlock {
    [HomeRecommendAPI shareInstance].jumpAlbumDetailBlock = jumpAlbumDetailBlock;
}


-(void)setPresentPlayerBlock:(void (^)(NSInteger))presentPlayerBlock {
    [HomeRecommendAPI shareInstance].presentPlayerBlock = presentPlayerBlock;
}

@end
