//
//  PlayerService.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "PlayerService.h"


@interface PlayerService()
{
    BOOL _isRemoteURL;
}
// 本地播放器
@property (nonatomic, strong) AudioTool *localAudioTool;

// 远程播放器
@property (nonatomic, strong) RemoteAudioTool *remoteAudioTool;



@end

@implementation PlayerService

static PlayerService *_shareInstance;

+ (instancetype)shareInstance{
    if (nil == _shareInstance) {
        _shareInstance = [[PlayerService alloc] init];
    }
    
    return _shareInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [super allocWithZone:zone];
    });
    
    return _shareInstance;
}

- (AudioTool *)localAudioTool {
    if (!_localAudioTool) {
        _localAudioTool = [[AudioTool alloc] init];
    }
    return _localAudioTool;
}

- (RemoteAudioTool *)remoteAudioTool
{
    if (!_remoteAudioTool) {
        _remoteAudioTool = [[RemoteAudioTool alloc] init];
    }
    return _remoteAudioTool;
}


- (void)playWithURL:(NSURL *)url withStateBlock: (void(^)(AudioState state))stateBlock {
    
    self.currentPlayURL = url;
    // 远程地址
    if ([url.absoluteString.uppercaseString containsString:@"HTTP"]) {
        _isRemoteURL = YES;
        if ([self.localAudioTool isPlaying]) {
            [self.localAudioTool pauseCurrentAudio];
        }
        
        [self.remoteAudioTool playWithURL:url withStateBlock:^(AudioState state) {
            stateBlock(self.state);
        }];
    }else {
        // 本地地址
        _isRemoteURL = NO;
        // 注意: 暂停远程, 会造成回调延迟, 导致block调用先本地开始, 远程暂停
        if (self.remoteAudioTool.state == AudioPlaying) {
            [self.remoteAudioTool pauseCurrentAudio];
        }
        
        [self.localAudioTool playAudioWithPath:url stateBlock:^(BOOL isPlaying) {
            stateBlock(self.state);
        }];
    }
    
}

- (float)currentPlayTime {
    
    return _isRemoteURL ? self.remoteAudioTool.currentPlayTime : self.localAudioTool.currentPlayTime;
    
}
- (float)currentTotalTime {
    return _isRemoteURL ? self.remoteAudioTool.currentTotalTime : self.localAudioTool.currentTotalTime;
}


- (void)seekProgress: (float)progress {
    
    if (_isRemoteURL) {
        [self.remoteAudioTool seekProgress:progress];
    }else {
        [self.localAudioTool seekProgress:progress];
    }
    
}




- (void)playCurrentAudio {
    
    if (_isRemoteURL) {
        [self.remoteAudioTool playCurrentAudio];
    }else {
        [self.localAudioTool playCurrentAudio];
    }
}

- (void)pauseCurrentAudio
{
    if (_isRemoteURL) {
        [self.remoteAudioTool pauseCurrentAudio];
    }else {
        [self.localAudioTool pauseCurrentAudio];
    }
}

- (void)seekBack: (unsigned int)time
{
    
    
    if (_isRemoteURL) {
        [self.remoteAudioTool seekBack:time];
    }else {
        [self.localAudioTool seekBack:time];
    }
    
}
- (void)seekFast: (unsigned int)time {
    
    if (_isRemoteURL) {
        [self.remoteAudioTool seekFast:time];
    }else {
        [self.localAudioTool seekFast:time];
    }
}

- (void)changeRate: (float)rate {
    
    if (_isRemoteURL) {
        [self.remoteAudioTool changeRate:rate];
    }else {
        [self.localAudioTool changeRate:rate];
    }
    
}

-(AudioState)state {
    if (_isRemoteURL) {
        return [self.remoteAudioTool state];
    }else {
        BOOL isPlaying = [self.localAudioTool isPlaying];
        if (isPlaying) {
            return AudioPlaying;
        }else {
            return AudioPause;
        }
    }
}



@end
