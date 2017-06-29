

#import "PlayerCell.h"
#import "UIImageView+FMExtension.h"

@interface PlayerCell()

@property (weak, nonatomic) IBOutlet UIImageView *userIcon;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;

@property (weak, nonatomic) IBOutlet UIButton *followCountBtn;

@property (weak, nonatomic) IBOutlet UIButton *voiceCountBtn;


@end

@implementation PlayerCell

- (void)setAlbumInfoM:(AlbumInfoModel *)albumInfoM
{
    _albumInfoM = albumInfoM;

    NSURL *url = [NSURL URLWithString:albumInfoM.coverSmall];
    [self.userIcon setURLImageWithURL:url placeHoldImage:nil isCircle:NO];

    self.nameLabel.text = albumInfoM.title;
    self.introduceLabel.text = albumInfoM.intro;

    [self.followCountBtn setTitle:[NSString stringWithFormat:@"%.01f万", albumInfoM.shares / 10000.0] forState:UIControlStateNormal];

    [self.voiceCountBtn setTitle:[NSString stringWithFormat:@"%zd集", albumInfoM.tracks] forState:UIControlStateNormal];


    

}


+ (instancetype)cellWithTableView:(UITableView *)tableView {

    PlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recommend"];
    if (cell == nil) {

        cell = [[NSBundle bundleForClass:self] loadNibNamed:@"PlayerCell" owner:nil options:nil].firstObject;
        

    }
    
    return cell;
}


@end
