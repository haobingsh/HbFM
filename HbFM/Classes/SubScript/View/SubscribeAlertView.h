

#import <UIKit/UIKit.h>
@protocol SubscribeAlertViewDelegate<NSObject>
@optional
- (void)subscribeAlertViewDidClickAlertButton:(NSString *)title;
@end

@interface SubscribeAlertView : UIView
@property (nonatomic, weak) id<SubscribeAlertViewDelegate> delegate;
@end
