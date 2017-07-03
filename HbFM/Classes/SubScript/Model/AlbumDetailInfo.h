//
//  AlbumDetailInfo.h
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 "albumId": 265897,
 "intro": "深夜十点，抽空读点书，放松一会，抚慰我们疲惫的心灵。",
 "introRich": "深夜十点，抽空读点书，放松一会，抚慰我们疲惫的心灵。",
 "tags": "读书,阅读,心灵,放松,深夜"
 */
@interface AlbumDetailInfo : NSObject

@property (nonatomic, assign) NSInteger albumId;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *introRich;
@property (nonatomic, copy) NSString *tags;

@property (nonatomic, assign) CGFloat contentCellHeight;

@end
