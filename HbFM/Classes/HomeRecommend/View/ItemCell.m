

#import "ItemCell.h"
#import "UIImageView+FMExtension.h"

@interface ItemCell ()

@property (weak, nonatomic) IBOutlet UIImageView *payIcon;

@property (weak, nonatomic) IBOutlet UIImageView *albumCoverImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;


@end

@implementation ItemCell


-(void)setItemInCellModel:(ItemInCellModel *)itemInCellModel
{
    _itemInCellModel = itemInCellModel;


    self.payIcon.hidden = [itemInCellModel.isPaid boolValue];
    NSURL *url = [NSURL URLWithString:itemInCellModel.albumCoverUrl290];
    [self.albumCoverImageView setURLImageWithURL:url placeHoldImage:[UIImage imageNamed:@"find_albumcell_cover_bg"] isCircle:NO];
    self.titleLabel.text = itemInCellModel.trackTitle;
    self.detailLabel.text = itemInCellModel.title;


}

@end
