

#import "RewardView.h"
#import "UpDownBtnPlayer.h"
#import "AlubmnDetailVC.h"
#import "UIView+FMNib.h"
#import "UIButton+WebCache.h"
#import "UIView+FMLayout.h"

@interface RewardView()

@property (weak, nonatomic) IBOutlet UILabel *voiceDetailLabel;

@property (weak, nonatomic) IBOutlet UpDownBtnPlayer *rewardCountBtn;

@property (weak, nonatomic) IBOutlet UIView *rewardUserContainerView;


@end


@implementation RewardView

-(void)awakeFromNib {

    [self.rewardCountBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

}

- (IBAction)viewAlubmnDetail {


    //
    AlubmnDetailVC *detailVC = [[AlubmnDetailVC alloc] initWithNibName:@"AlubmnDetailVC" bundle:[NSBundle bundleForClass:[self class]]];
    detailVC.trackID = self.rewardInfoM.trackID;
    [self.currentViewController.navigationController pushViewController:detailVC animated:YES];

    
}



-(void)setRewardInfoM:(TrackRewardInfoModel *)rewardInfoM
{
    _rewardInfoM = rewardInfoM;


    self.voiceDetailLabel.text = [NSString stringWithFormat:@"声音简介: %@", rewardInfoM.voiceIntro];

    [self.rewardCountBtn setTitle:[NSString stringWithFormat:@"%zd人打赏", rewardInfoM.numOfRewards] forState:UIControlStateNormal];

    [self.rewardUserContainerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    // 添加btn
    NSInteger count = rewardInfoM.rewords.count;
    // 如果多余6个, 只取6个
    if (count > 6) {
        count = 6;
    }

    for (int i = 0; i < count; i++) {
        RewardModel *rewardM = rewardInfoM.rewords[i];
        UpDownBtnPlayer *rewardBtn = [[UpDownBtnPlayer alloc] init];
        [self.rewardUserContainerView addSubview:rewardBtn];
        NSURL *url = [NSURL URLWithString:rewardM.smallLogo];
        [rewardBtn sd_setImageWithURL:url forState:UIControlStateNormal completed:nil];
        [rewardBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [rewardBtn setTitle:[NSString stringWithFormat:@"￥%zd", rewardM.amount] forState:UIControlStateNormal];
    }


    
}

-(void)layoutSubviews
{
    [super layoutSubviews];

    NSInteger count = self.rewardUserContainerView.subviews.count;

    CGFloat btnW = 30;
    CGFloat btnH = self.rewardUserContainerView.height;
    CGFloat btnY = 0;
    CGFloat margin = 10;
    CGFloat baseX = (self.width - count * (btnW + margin)) * 0.5;

    for (int i = 0; i < count; i++) {
        UpDownBtnPlayer *btn = self.rewardUserContainerView.subviews[i];
        btn.frame = CGRectMake(baseX + i * (btnW + margin), btnY, btnW, btnH);
    }



}



@end
