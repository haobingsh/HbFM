

#import "PlayerGroupCell.h"
#import "PlayerCell.h"
#import "CommentCell.h"
#import "UIView+FMNib.h"
#import "PlayerDefine.h"

@interface PlayerGroupCell() <UITableViewDataSource, UITableViewDelegate>
{
    BOOL _isComment;
}

@property (weak, nonatomic) IBOutlet UILabel *groupTitleLabel;

@property (weak, nonatomic) IBOutlet UIButton *groupDetailBtn;

@property (weak, nonatomic) IBOutlet UITableView *contentTableView;

@end

@implementation PlayerGroupCell


- (IBAction)viewMore {

    if (self.associationAlbumGroupM.clickBlock != nil) {
        self.associationAlbumGroupM.clickBlock();
    }

    if (self.commentGroupM.clickBlock != nil) {
        self.commentGroupM.clickBlock();
    }
}

-(void)setCommentGroupM:(PlayerCommentGroupModel *)commentGroupM
{
    _commentGroupM = commentGroupM;

    self.groupTitleLabel.text = _commentGroupM.groupTitle;
    [self.groupDetailBtn setTitle:_commentGroupM.groupDetailTitle forState:UIControlStateNormal];

    _isComment = YES;

    CGFloat totalH = 0;
    for (CommentInfoModel *commentInfoM in _commentGroupM.commentInfoMs) {
        totalH += commentInfoM.cellHeight;
    }

    totalH += 60;
    commentGroupM.cellHeight = totalH;

    [self.contentTableView reloadData];



}


-(void)setAssociationAlbumGroupM:(PlayerGroupModel *)associationAlbumGroupM
{
    _isComment = NO;
    _associationAlbumGroupM = associationAlbumGroupM;
    self.groupTitleLabel.text = associationAlbumGroupM.groupTitle;
    [self.groupDetailBtn setTitle:associationAlbumGroupM.groupDetailTitle forState:UIControlStateNormal];

    _associationAlbumGroupM.cellHeight = self.associationAlbumGroupM.albumInfoMs.count * 70 + 60;

    [self.contentTableView reloadData];

}
+ (instancetype)cellWithTableView:(UITableView *)tableView {

    PlayerGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playerGroup"];
    if (cell == nil) {

        cell = [[NSBundle bundleForClass:self] loadNibNamed:@"PlayerGroupCell" owner:nil options:nil].firstObject;

    }

    return cell;
}

-(void)awakeFromNib{
    self.contentTableView.scrollEnabled = NO;
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    NSInteger count = _isComment ? self.commentGroupM.commentInfoMs.count : self.associationAlbumGroupM.albumInfoMs.count;
    return count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

     UITableViewCell *cell;
     if (!_isComment) {
         cell = [PlayerCell cellWithTableView:tableView];
         ((PlayerCell *)cell).albumInfoM = self.associationAlbumGroupM.albumInfoMs[indexPath.row];
     }else {

         cell = [CommentCell cellWithTableView:tableView];
         ((CommentCell *)cell).commentInfoM = self.commentGroupM.commentInfoMs[indexPath.row];


     }
    return  cell;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

//    return 80;
    if (_isComment) {
        CommentInfoModel *commentInfoM = self.commentGroupM.commentInfoMs[indexPath.row];
        return commentInfoM.cellHeight;
    }

    return 70;

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (_isComment) {

        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择需要的操作" message:nil preferredStyle:UIAlertControllerStyleActionSheet];

        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"查看资料" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"查看资料");
        }];

        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"回复" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"回复");
        }];

        UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"投诉评论" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"投诉评论");
        }];

        UIAlertAction *action4 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

        }];


        [alertController addAction:action1];
        [alertController addAction:action2];
        [alertController addAction:action3];
        [alertController addAction:action4];

        [self.currentViewController presentViewController:alertController animated:YES completion:nil];

    }else {

        AlbumInfoModel *model = self.associationAlbumGroupM.albumInfoMs[indexPath.row];

        // 跳转到专辑详情
        kJumpToAlbumDetail(@(model.albumId), self.currentViewController.navigationController)
    }

}

-(void)layoutSubviews
{
    [super layoutSubviews];

}

@end
