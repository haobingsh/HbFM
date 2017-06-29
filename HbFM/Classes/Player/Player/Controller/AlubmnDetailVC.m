

#import "AlubmnDetailVC.h"
#import "PlayerDataTool.h"
#import "Base.h"

@interface AlubmnDetailVC ()
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation AlubmnDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.title = @"声音详情";

    kWeakSelf
    [[PlayerDataTool shareInstance] getTrackDetailWithTrackID:self.trackID result:^(AlubmnDetailModel *alubmnDetailM) {

        weakSelf.introduceLabel.text = alubmnDetailM.richIntro;
        weakSelf.detailLabel.text = alubmnDetailM.lyric;


    }];

}




@end
