
#import "AlbumTagCell.h"
@interface AlbumTagCell()
@property (weak, nonatomic) IBOutlet UIButton *tagButton;
@property (strong, nonatomic) IBOutlet UIView *tagButtonView;
@end

@implementation AlbumTagCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.tagButton.layer.borderWidth = 0.5;
    self.tagButton.layer.borderColor = [UIColor orangeColor].CGColor;
    self.tagButton.layer.cornerRadius = 4;
    self.tagButton.layer.masksToBounds = YES;
}

- (IBAction)tagButtonClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(albumTagCellDidClickTagButton)]) {
        [self.delegate albumTagCellDidClickTagButton];
    }
}


@end
