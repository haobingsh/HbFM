

#import "NoDataView.h"

@implementation NoDataView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.gotoRecommendButton.layer.cornerRadius = 4;
    self.gotoRecommendButton.layer.masksToBounds = YES;
}

@end
