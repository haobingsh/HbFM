

#import "PlayListSheetView.h"
#import "TrackInfoModel.h"
#import "TrackInfoListCell.h"
#import "PlayerDataTool.h"

#import "PlayerSetModelToCell.h"
#import "Base.h"
//#import "DownLoadService.h"
//#import "DownLoadDataTool.h"

@interface PlayListSheetView()<UITableViewDataSource, UITableViewDelegate>



@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign) NSInteger trackID;

@end

@implementation PlayListSheetView

-(void)setCurrentIndex:(NSInteger)currentIndex {
    if (self.trackInfoMs.count == 0 || currentIndex < 0 || currentIndex > self.trackInfoMs.count - 1) {
        _currentIndex = 0;
        return;
    }
    _currentIndex = currentIndex;
}

-(void)setTrackInfoMs:(NSMutableArray<TrackInfoModel *> *)trackInfoMs
{
    _trackInfoMs = trackInfoMs;
    [self.tableView reloadData];
}

- (IBAction)playModel:(UIButton *)sender {

    NSLog(@"切换播放模式");
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:@"downLoadStateChangeNotification" object:nil];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (IBAction)close {

    if (self.closeBlock != nil) {
        self.closeBlock();
    }

}
-(void)refreshData {
    [self.tableView reloadData];
}


- (void)setAlbumID:(NSInteger)albumID trackID:(NSInteger)trackId {
    self.trackID = trackId;
    kWeakSelf;
    [[PlayerDataTool shareInstance] getTrackMsWithAlbumId:albumID trackId:trackId result:^(NSMutableArray<TrackInfoModel *> *trackMs) {
        weakSelf.trackInfoMs = trackMs;
    }];

}


#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.trackInfoMs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    TrackInfoListCell *cell = [TrackInfoListCell cellWithTableView:tableView];

    __weak TrackInfoModel *trackM = self.trackInfoMs[indexPath.row];

    if (trackM.trackId == self.trackID) {
        cell.playingLogo.image = [UIImage imageNamed:@"sound_playingbtn.gif"];
    }else {
        cell.playingLogo.image = nil;
    }

    cell.downLoadBlock = ^{
//        XMGDownLoadVoiceModel *voiceM = [[XMGDownLoadVoiceModel alloc] init];
//        voiceM.uid = trackM.uid;
//        voiceM.id = trackM.trackId;
//        [[XMGDownLoadDataTool shareInstance] setDownLoadMessageToVoiceM:voiceM complete:^{
//            [XMGDownLoadService downLoadVoiceM:voiceM];
//        }];
    };

    [PlayerSetModelToCell setModel:self.trackInfoMs[indexPath.row] toCell:cell];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    TrackInfoModel *trackM = self.trackInfoMs[indexPath.row];

    if (self.clickItemBlock) {
        self.clickItemBlock(trackM);
    }

}




@end
