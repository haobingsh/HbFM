

#import <UIKit/UIKit.h>
@protocol AlbumTagCellDelegate<NSObject>
- (void)albumTagCellDidClickTagButton;
@end

@interface AlbumTagCell : UITableViewCell
@property (nonatomic, weak) id<AlbumTagCellDelegate> delegate;
@end
