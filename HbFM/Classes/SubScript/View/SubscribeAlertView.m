

#import "SubscribeAlertView.h"

@implementation SubscribeAlertView

- (IBAction)alertButtonClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(subscribeAlertViewDidClickAlertButton:)]) {
        [self.delegate subscribeAlertViewDidClickAlertButton:sender.titleLabel.text];
    }
}

@end
