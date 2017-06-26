

#import <UIKit/UIKit.h>
#import "GroupModel.h"

@interface SpecialColumnCell : UITableViewCell

@property (nonatomic, strong) GroupModel *groupM;

+ (instancetype)cellWithTableView: (UITableView *)tableView;

@end
