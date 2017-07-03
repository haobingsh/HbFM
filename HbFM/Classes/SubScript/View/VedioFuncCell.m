

#import "VedioFuncCell.h"

@interface VedioFuncCell()
@property (strong, nonatomic) IBOutlet UILabel *setNumLabel;
@property (strong, nonatomic) IBOutlet UIButton *sortButton;

@end

@implementation VedioFuncCell

// 选集
- (IBAction)chooseButtonClick:(UIButton *)sender {
    if (sender.selected) {
        self.sortButton.userInteractionEnabled = NO;
    }else
    {
        self.sortButton.userInteractionEnabled = YES;
    }
    
}

// 排序
- (IBAction)sortButtonClick:(UIButton *)sender {
    
}

@end
