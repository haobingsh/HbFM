//
//  XMGSpecialColumnCell.m
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/5.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "SpecialColumnCell.h"
#import "CellInCell.h"

#define kCellMargin 10

@interface SpecialColumnCell()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SpecialColumnCell

static NSString *const cellID = @"CellTypeList2";


+ (instancetype)cellWithTableView: (UITableView *)tableView {

    SpecialColumnCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {

        cell = [[NSBundle bundleForClass:self] loadNibNamed:@"SpecialColumnCell" owner:nil options:nil].firstObject;
//        cell = [XMGSpecialColumnCell loadFromNib];
    }
    return cell;

}

-(void)setFrame:(CGRect)frame
{
    frame.size.height -= kCellMargin;
    [super setFrame:frame];
}


-(void)awakeFromNib
{
    [super awakeFromNib];
    self.tableView.rowHeight = 80;
    self.tableView.scrollEnabled = NO;
}

-(void)setGroupM:(GroupModel *)groupM
{
    _groupM = groupM;
    self.titleLabel.text = groupM.title;
    [self.tableView reloadData];
    
}

- (IBAction)more {
}



#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groupM.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellInCell *cell = [CellInCell cellWithTableView:tableView];

    SpecialColumnModel *specialM = self.groupM.list[indexPath.row];
    if (![specialM isKindOfClass:[SpecialColumnModel class]]) {
        return nil;
    }

    cell.specialColumnM = specialM;

    return cell;

}

@end
