

#import <UIKit/UIKit.h>
#import "SpecialColumnModel.h"

@interface CellInCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) SpecialColumnModel *specialColumnM;

@end
