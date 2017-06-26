
#import "NominateEditorCell.h"
#import "UIImageView+WebCache.h"


@interface NominateEditorCell ()
@property (weak, nonatomic) IBOutlet UIImageView *smallImageView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;

@property (weak, nonatomic) IBOutlet UIButton *playsCountsBtn;

@property (weak, nonatomic) IBOutlet UIButton *tracksBtn;

@end

@implementation NominateEditorCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.smallImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.smallImageView.layer.shadowOffset = CGSizeMake(0, 0);
    self.smallImageView.layer.shadowOpacity = 0.5;
}

- (void)setModel:(NominateEditorModel *)model
{
    
    _model = model;
    [self.smallImageView sd_setImageWithURL:[NSURL URLWithString:model.coverSmall] placeholderImage:[UIImage imageNamed:@"find_albumcell_cover_bg"]];
    self.title.text = model.title;
    self.introLabel.text = model.intro;
    [self.playsCountsBtn setTitle:[NSString stringWithFormat:@"%.1f万", model.playsCounts / 10000.0] forState:UIControlStateNormal];
    
    [self.tracksBtn setTitle:[NSString stringWithFormat:@"%zd集", model.tracks] forState:UIControlStateNormal];
}

@end
