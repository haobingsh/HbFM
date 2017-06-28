

#import <UIKit/UIKit.h>
#import "GroupModel.h"

@interface AdPicTextCell : UITableViewCell

@property (nonatomic, strong) GroupModel *groupM;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
