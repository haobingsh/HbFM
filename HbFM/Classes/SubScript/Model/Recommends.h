//
//  Recommends.h
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recommends : NSObject

@property (nonatomic, copy) NSString *albumId;
@property (nonatomic, copy) NSString *basedRelativeAlbumId;
@property (nonatomic, copy) NSString *coverLarge;
@property (nonatomic, copy) NSString *coverMiddle;
@property (nonatomic, copy) NSString *info;
@property (nonatomic, copy) NSString *lastUptrackAt;
@property (nonatomic, copy) NSString *lastUptrackId;
@property (nonatomic, copy) NSString *lastUptrackTitle;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *playsCounts;
@property (nonatomic, copy) NSString *recReason;
@property (nonatomic, copy) NSString *recSrc;
@property (nonatomic, copy) NSString *recTrack;
@property (nonatomic, copy) NSString *serialState;
@property (nonatomic, copy) NSString *tags;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *trackId;
@property (nonatomic, copy) NSString *trackTitle;
@property (nonatomic, copy) NSString *tracks;
@property (nonatomic, copy) NSString *uid;

@property (nonatomic, assign) CGFloat cellHeight;

@end
