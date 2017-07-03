

#import "TagSortView.h"
@interface TagSortView()
@property (weak, nonatomic) IBOutlet UIButton *sohotButton;
@property (weak, nonatomic) IBOutlet UIButton *sonewButton;
@property (weak, nonatomic) IBOutlet UIButton *tomoreButton;

@end

@implementation TagSortView

- (IBAction)sortButtonClick:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:@"最火"]) {
        self.sohotButton.selected = YES;
        self.sonewButton.selected = NO;
        self.tomoreButton.selected = NO;
    }else if ([sender.titleLabel.text isEqualToString:@"最新上传"])
    {
        self.sohotButton.selected = NO;
        self.sonewButton.selected = YES;
        self.tomoreButton.selected = NO;
    }else
    {
        self.sohotButton.selected = NO;
        self.sonewButton.selected = NO;
        self.tomoreButton.selected = YES;
    }
    if ([self.delegate respondsToSelector:@selector(tagSortDidClickButton:)]) {
        [self.delegate tagSortDidClickButton:sender.titleLabel.text];
    }
}

@end
