
#import <UIKit/UIKit.h>

#import "AlbumInfoModel.h"

@interface UserInfoCell : UITableViewCell

@property (nonatomic, strong) AlbumInfoModel *albumInfoM;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
