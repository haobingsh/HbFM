

#import <UIKit/UIKit.h>
#import "AlbumInfoModel.h"


@interface PlayerCell : UITableViewCell

@property (nonatomic, strong) AlbumInfoModel *albumInfoM;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
