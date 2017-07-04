//
//  DownLoadService.h
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownLoadVoiceModel.h"

#define kDownLoadStateChangeNotification @"downLoadStateChangeNotification"

@interface DownLoadService : NSObject

+ (instancetype)shareInstance;

/**
 *  根据给定的音频模型, 下载对应的数据
 *
 *  @param downLoadVoiceM 音频数据模型
 */
+ (void)downLoadVoiceM:(DownLoadVoiceModel *)downLoadVoiceM;
/**
 *  根据给定的音频模型, 暂停对应的数据
 *
 *  @param downLoadVoiceM 音频数据模型
 */
+ (void)pauseVoiceM:(DownLoadVoiceModel *)downLoadVoiceM;
/**
 *  根据给定的音频模型, 停止对应的数据
 *
 *  @param downLoadVoiceM 音频数据模型
 */
+ (void)stopVoiceM:(DownLoadVoiceModel *)downLoadVoiceM;


/**
 *  验证, 是否已经下载
 *
 *  @param filePath 文件路径
 *
 *  @return 是否已经下载
 */
+ (BOOL)isExsists:(NSString *)filePath;


@end
