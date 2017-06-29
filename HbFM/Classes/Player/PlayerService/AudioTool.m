//
//  AudioTool.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "AudioTool.h"

@interface AudioTool()

@property (nonatomic ,strong) AVAudioPlayer  *player;
@property (nonatomic, copy) void(^stateBlock)(BOOL isPlaying);

@end


@implementation AudioTool

- (void)setBackPlay
{
    // 1. 获取音频回话
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    // 2. 设置音频回话类别
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    // 3. 激活音频回话
    [session setActive:YES error:nil];
}


- (void)playAudioWithPath:(NSURL *)filePath stateBlock:(void(^)(BOOL isPlaying))stateBlock {
    self.stateBlock = stateBlock;
    if ([filePath isEqual:self.player.url]) {
        [self.player play];
        stateBlock(self.player.isPlaying);
        return;
    }
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:filePath error:nil];
    self.player.enableRate = YES;
    [self.player prepareToPlay];
    [self.player play];
    if (self.stateBlock) {
        self.stateBlock(self.player.isPlaying);
    }
    
}

- (void)playCurrentAudio {
    [self.player play];
    if (self.stateBlock) {
        self.stateBlock(self.player.isPlaying);
    }
}
- (void)pauseCurrentAudio {
    [self.player pause];
    if (self.stateBlock) {
        self.stateBlock(self.player.isPlaying);
    }
}

- (float)currentPlayTime {
    return self.player.currentTime;
}
- (float)currentTotalTime {
    return self.player.duration;
}

- (void)seekBack: (unsigned int)time {
    self.player.currentTime -= time;
}
- (void)seekFast: (unsigned int)time {
    self.player.currentTime += time;
}
- (void)seekProgress: (float)progress {
    
    self.player.currentTime = self.player.duration * progress;
    
}

- (void)changeRate: (float)rate {
    self.player.rate = rate;
}

- (BOOL)isPlaying {
    return self.player.isPlaying;
}

@end
