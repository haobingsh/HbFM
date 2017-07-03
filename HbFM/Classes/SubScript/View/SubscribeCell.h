

#import <UIKit/UIKit.h>
@class Subscribe;

@protocol SubscribeCellDelegate<NSObject>
@optional
- (void)subscribeCellDidClickDownButton;
@end

@interface SubscribeCell : UITableViewCell

@property (nonatomic, weak) id<SubscribeCellDelegate> delegate;
@property(nonatomic, strong) Subscribe *subscribe;

@end
