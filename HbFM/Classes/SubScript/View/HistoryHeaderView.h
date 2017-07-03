

#import <UIKit/UIKit.h>
@protocol HistoryHeaderViewDelegate<NSObject>
@optional
- (void)historyHeaderViewDidClickHeaderButton:(NSString *)title;
@end

@interface HistoryHeaderView : UIView
@property (nonatomic,weak) id<HistoryHeaderViewDelegate> delegate;
@end
