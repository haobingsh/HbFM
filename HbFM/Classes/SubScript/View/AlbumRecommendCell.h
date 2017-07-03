

#import <UIKit/UIKit.h>
@class OtherRecommands;

@protocol AlbumRecommendCellDelegate<NSObject>

- (void)albumRecommendCellDidSelectCell:(NSString *)albumId;

@end

typedef void(^GetMoreRecommend)();
@interface AlbumRecommendCell : UITableViewCell

/** 点击查看更多 回调**/
@property(nonatomic, copy)GetMoreRecommend getMoreRecommend;


@property (nonatomic, strong)OtherRecommands *otherRecommands;
@property (nonatomic, weak) id<AlbumRecommendCellDelegate> delegate;
@end
