

#import <UIKit/UIKit.h>
#import "PlayerGroupModel.h"
#import "PlayerCommentGroupModel.h"

@interface PlayerGroupCell : UITableViewCell

@property (nonatomic, strong) PlayerGroupModel *associationAlbumGroupM;

@property (nonatomic, strong) PlayerCommentGroupModel *commentGroupM;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
