

#import "CommentCell.h"
#import "UIImageView+FMExtension.h"

@interface CommentCell()

@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *zanBtn;

@end


@implementation CommentCell


+ (instancetype)cellWithTableView:(UITableView *)tableView {

    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"comment"];
    if (cell == nil) {

        cell = [[[NSBundle bundleForClass:self] loadNibNamed:@"CommentCell" owner:nil options:nil] firstObject];
    }
    return cell;
}


-(void)setCommentInfoM:(CommentInfoModel *)commentInfoM
{
//    self.backgroundColor = [UIColor whiteColor];
    _commentInfoM = commentInfoM;

    NSURL *url = [NSURL URLWithString:commentInfoM.smallHeader];
    [self.userIcon setURLImageWithURL:url placeHoldImage:[UIImage imageNamed:@"iconImage"] isCircle:YES];

    self.nameLabel.text = commentInfoM.nickname;
    self.commentLabel.text = commentInfoM.content;

    self.timeLabel.text = [NSString stringWithFormat:@"%zd", commentInfoM.createdAt];
    [self.zanBtn setTitle: [NSString stringWithFormat:@"%zd", commentInfoM.likes] forState:UIControlStateNormal];




}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
