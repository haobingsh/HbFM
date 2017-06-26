//
//  XMGCellInCell.m
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/5.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "CellInCell.h"
#import "UIImageView+FMExtension.h"

@interface CellInCell ()

@property (weak, nonatomic) IBOutlet UIImageView *specialIcon;
@property (weak, nonatomic) IBOutlet UILabel *topTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomTitleLabel;

@end

@implementation CellInCell

static NSString *const cellID = @"cellInCell";

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    CellInCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {

        cell = [[NSBundle bundleForClass:self] loadNibNamed:@"CellInCell" owner:nil options:nil].firstObject;
    }
    return cell;
}

-(void)setSpecialColumnM:(SpecialColumnModel *)specialColumnM
{
    _specialColumnM = specialColumnM;
    NSURL *url = [NSURL URLWithString:specialColumnM.coverPath];
    [self.specialIcon setURLImageWithURL:url placeHoldImage:[UIImage imageNamed:@"find_albumcell_cover_bg"] isCircle:NO];
    self.topTitleLabel.text = specialColumnM.title;
    self.middleTitleLabel.text = specialColumnM.subtitle;
    self.bottomTitleLabel.text = specialColumnM.footnote;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
