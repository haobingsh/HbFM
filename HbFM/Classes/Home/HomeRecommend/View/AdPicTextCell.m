

#import "AdPicTextCell.h"
#import "AdPicView.h"
#import "UIImageView+FMExtension.h"
#import "AdPicModel.h"


#define kCellMargin 10

@interface AdPicTextCell ()<AdPicViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet AdPicView *adPicView;
@property (weak, nonatomic) IBOutlet UILabel *upTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightTitleLabel;


@end

@implementation AdPicTextCell

static NSString *const cellID = @"CellTypeList1";

+ (instancetype)cellWithTableView: (UITableView *)tableView {

    AdPicTextCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {

        cell =  [[NSBundle bundleForClass:self] loadNibNamed:@"AdPicTextCell" owner:nil options:nil].firstObject;
    }
    return cell;
    
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self.adPicView setLoadBlock:^(UIImageView *imageView, NSURL *url){
        [imageView setURLImageWithURL:url progress:nil complete:nil];

    }];
    self.adPicView.delegate = self;
}

-(void)setGroupM:(GroupModel *)groupM
{
    _groupM = groupM;
    self.titleLabel.text = groupM.title;

    NSMutableArray *picMs = [NSMutableArray array];

    NSLog(@"%@", groupM.liveMs);

    if (groupM.liveMs.count > 0) {
        for (LiveModel *liveM in groupM.liveMs) {
            AdPicModel *picM = [[AdPicModel alloc] init];
            picM.liveM = liveM;
            [picMs addObject:picM];
        }
    }else if (groupM.tuiguangMs.count > 0)
    {
        for (TuiguangModel *tuiguangM in groupM.tuiguangMs) {
            AdPicModel *picM = [[AdPicModel alloc] init];
            picM.tuiguangM = tuiguangM;
            [picMs addObject:picM];
        }
    }



    self.adPicView.picModels = picMs;

}
-(void)setFrame:(CGRect)frame
{
    frame.size.height -= kCellMargin;
    [super setFrame:frame];
}

- (IBAction)more {

}

-(void)adPicViewDidSelectedPicModel:(AdPicModel *)picM
{
    

    LiveModel *liveM = picM.liveM;
    if (liveM != nil) {
        self.upTitleLabel.text = liveM.name;
        self.detailTitleLabel.text = liveM.shortDescription;
        double count = [liveM.playCount doubleValue];
        if (count > 10000) {
            count = count / 10000.0;
            self.rightTitleLabel.text = [NSString stringWithFormat:@"%.01f万人参与", count];
        }else {
            self.rightTitleLabel.text = [NSString stringWithFormat:@"%zd人参与", count];
        }
    }

    TuiguangModel *tuiguangM = picM.tuiguangM;
    if (tuiguangM != nil) {
        self.upTitleLabel.text = tuiguangM.name;
        self.detailTitleLabel.text = tuiguangM.Description;

    }


}


@end
