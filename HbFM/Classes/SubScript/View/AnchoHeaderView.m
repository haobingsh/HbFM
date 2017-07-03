

#import "AnchoHeaderView.h"
#import "Base.h"
#import "UIView+FmLayout.h"

@interface AnchoHeaderView()
@property (strong, nonatomic) IBOutlet UIButton *attendButton;
@property (strong, nonatomic) IBOutlet UIButton *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *infoLabel;
@property (strong, nonatomic) IBOutlet UILabel *attendNumLabel;
@property (strong, nonatomic) IBOutlet UILabel *fansNumLabel;
@property (strong, nonatomic) IBOutlet UILabel *zanNumLabel;
@end

@implementation AnchoHeaderView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.attendButton.layer.cornerRadius = 2;
    self.attendButton.layer.masksToBounds = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.width = kScreenWidth;
    self.height = 280.5;
}

// 5 - 关注，6 - 粉丝，7 - 赞过的
- (IBAction)hearderBottomButtonClick {
    
}

// 关注
- (IBAction)attendButtonClick {
}

@end
