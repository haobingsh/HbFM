

#import <UIKit/UIKit.h>

@interface DownLoadAlbumCell : UITableViewCell

/** 专辑图片 */
@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;
/** 专辑标题 */
@property (weak, nonatomic) IBOutlet UILabel *albumTitleLabel;
/** 专辑作者 */
@property (weak, nonatomic) IBOutlet UILabel *albumAuthorLabel;
/** 专辑集数 */
@property (weak, nonatomic) IBOutlet UIButton *albumPartsBtn;
/** 专辑大小 */
@property (weak, nonatomic) IBOutlet UIButton *albumPartsSizeBtn;

/** 删除按钮点击执行代码块 */
@property (nonatomic, strong) void(^deleteBlock)();

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
