

#import "DownLoadVoiceCell.h"
#import "UIView+FMLayout.h"
#import "PlayerService.h"
#import "DownLoadAPIDefine.h"
#import "DownLoadDataTool.h"

@interface DownLoadVoiceCell()


@end


@implementation DownLoadVoiceCell

static NSString *const cellID = @"downLoadVoice";

+ (instancetype)cellWithTableView:(UITableView *)tableView {

    DownLoadVoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:self] loadNibNamed:@"DownLoadVoiceCell" owner:nil options:nil] firstObject];
    }

    return cell;
}



-(void)layoutSubviews {
    [super layoutSubviews];
//    self.playOrPauseBtn.layer.cornerRadius = self.playOrPauseBtn.width * 0.5;

}
- (IBAction)playOrPause:(UIButton *)sender {
    sender.selected = !sender.selected;

    [[NSNotificationCenter defaultCenter] postNotificationName:@"playImage" object:[sender backgroundImageForState:UIControlStateNormal]];


    if (sender.selected) {
        kLoadTrackInfo(@(self.trackID))
        [[PlayerService shareInstance] playWithURL:self.playURL withStateBlock:^(AudioState state) {
            if (state == AudioPlaying) {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"playState" object:@(YES)];
            }else {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"playState" object:@(NO)];
            }

        }];
    }else {
        [[PlayerService shareInstance] pauseCurrentAudio];
    }

    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.playOrPauseBtn.layer.cornerRadius = 20;
    self.playOrPauseBtn.layer.masksToBounds = YES;
    self.playOrPauseBtn.layer.borderWidth = 3;
    self.playOrPauseBtn.layer.borderColor = [[UIColor whiteColor] CGColor];
    // 监听播放状态通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playStateChange:) name:@"playState" object:nil];

}

-(void)playStateChange:(NSNotification *)notification {

    BOOL isPlaying = [notification.object boolValue];

    if ([[PlayerService shareInstance].currentPlayURL isEqual:self.playURL] ||  [DownLoadDataTool shareInstance].currentTrackID == self.trackID) {
        self.playOrPauseBtn.selected = isPlaying;
    }else {
        self.playOrPauseBtn.selected = NO;
    }
    
    
}




- (IBAction)downLoadOrPause:(UIButton *)sender {

    sender.selected = !sender.selected;
    if (self.downLoadBlock) {
        self.downLoadBlock(sender.selected);
    }

}
- (IBAction)deleteFile {

    if (self.deleteBlock) {
        self.deleteBlock();
    }

}


@end
