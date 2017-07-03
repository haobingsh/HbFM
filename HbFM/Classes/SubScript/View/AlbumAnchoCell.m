

#import "AlbumAnchoCell.h"
#import "AnchorInfo.h"
#import "UIImageView+FMExtension.h"

@interface AlbumAnchoCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;

@end

@implementation AlbumAnchoCell


- (void)setAnchorInfo:(AnchorInfo *)anchorInfo{
    _anchorInfo = anchorInfo;
    
    [self.iconImageView setURLImageWithURL:[NSURL URLWithString:anchorInfo.smallLogo] placeHoldImage:[UIImage imageNamed:@"find_albumcell_cover_bg"] isCircle:YES];
    self.titleLabel.text = anchorInfo.ptitle;
    self.subTitleLabel.text = [NSString stringWithFormat:@"已被%.1f万人关注", anchorInfo.followers / 10000.0];
    self.introLabel.text = anchorInfo.personalSignature;
    
}

- (IBAction)attendButtonClick:(UIButton *)sender {
    sender.selected = !sender.selected;
}


@end
