

#import "HistoryHeaderView.h"
#import "Base.h"
#import "UIView+FMLayout.h"

@implementation HistoryHeaderView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.width = kScreenWidth;
    self.height = 44;
}

- (IBAction)headerButtonClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(historyHeaderViewDidClickHeaderButton:)]) {
        [self.delegate historyHeaderViewDidClickHeaderButton:sender.titleLabel.text];
    }
}


@end
