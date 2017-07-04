//
//  DownLoadAlbumModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownLoadVoiceModel.h"

@interface DownLoadAlbumModel : NSObject

@property (nonatomic, strong) NSMutableArray <DownLoadVoiceModel *>*voiceMs;

/** 删除按钮点击执行代码块 */
@property (nonatomic, strong) void(^deleteBlock)();

/** 格式化后的文件大小 */
@property (nonatomic, copy) NSString *fileFormatSize;

@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, assign) NSInteger albumId;
@property (nonatomic, assign) NSInteger trackCount;
@property (nonatomic, copy) NSString *albumCoverMiddle;
@property (nonatomic, copy) NSString *albumTitle;

@end
