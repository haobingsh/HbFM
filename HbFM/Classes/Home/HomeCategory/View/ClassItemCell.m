
#import "ClassItemCell.h"
#import "ClassItemModel.h"
#import "UIButton+WebCache.h"

@interface ClassItemCell()
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@end

@implementation ClassItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setModels:(NSArray *)models
{
    
    _models = models;
    ClassItemModel *leftModel = self.models[0];
    ClassItemModel *rightModel = self.models[1];
    
    [self.leftBtn setTitle:leftModel.title forState:UIControlStateNormal];
    [self.leftBtn sd_setImageWithURL:[NSURL URLWithString:leftModel.coverPath] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"findCategory_default"]];
    
    [self.rightBtn setTitle:rightModel.title forState:UIControlStateNormal];
    [self.rightBtn sd_setImageWithURL:[NSURL URLWithString:rightModel.coverPath] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"findCategory_default"]];
    
}


@end
