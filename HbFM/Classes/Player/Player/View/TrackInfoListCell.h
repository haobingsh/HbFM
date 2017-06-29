

#import <UIKit/UIKit.h>


@interface TrackInfoListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *playingLogo;

@property (weak, nonatomic) IBOutlet UILabel *trackTitleLabel;

@property (weak, nonatomic) IBOutlet UIButton *downLoadBtn;

@property (nonatomic, strong) void(^downLoadBlock)();


+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
