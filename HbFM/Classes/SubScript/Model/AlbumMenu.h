//
//  AlbumMenu.h
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Album;
@class Tracks;

@interface AlbumMenu : NSObject

/** 头部的数据 **/
@property (nonatomic, strong) Album *album;

/** 节目的数据 **/
@property (nonatomic, strong) Tracks *tracks;

@end
