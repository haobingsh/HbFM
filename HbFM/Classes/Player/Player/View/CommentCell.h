

#import <UIKit/UIKit.h>
#import "CommentInfoModel.h"


@interface CommentCell : UITableViewCell

@property (nonatomic, strong) CommentInfoModel *commentInfoM;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
