

#import <UIKit/UIKit.h>
#import "GroupModel.h"

@interface RecommendCell : UITableViewCell

@property (nonatomic, strong) GroupModel *groupM;

+ (instancetype)cellWithTableView: (UITableView *)tableView;

@end
