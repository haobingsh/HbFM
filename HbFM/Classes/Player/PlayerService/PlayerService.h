//
//  PlayerService.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AudioTool.h"
#import "RemoteAudioTool.h"

@interface PlayerService : NSObject

+ (instancetype)shareInstance;

@property (nonatomic, assign) AudioState state;
@property (nonatomic, copy) NSURL *currentPlayURL;

- (void)playWithURL:(NSURL *)url withStateBlock: (void(^)(AudioState state))stateBlock;

- (void)playCurrentAudio;
- (void)pauseCurrentAudio;

- (float)currentPlayTime;
- (float)currentTotalTime;

- (void)seekBack: (unsigned int)time;
- (void)seekFast: (unsigned int)time;
- (void)seekProgress: (float)progress;

- (void)changeRate: (float)rate;

@end
