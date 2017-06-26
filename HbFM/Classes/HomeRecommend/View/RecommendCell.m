

#import "RecommendCell.h"
#import "ItemCell.h"
#import "RecommendTVC.h"
#import "RecommendMoreTVC.h"// 更多
#import "UIView+FMNib.h"
#import "Base.h"
#import "HomeRecommendDefine.h"

#define kCellCountInRow 3
#define kCellMargin 10

@interface RecommendCell()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;



@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation RecommendCell

static NSString *const itemID = @"itemID";
static NSString *const cellID = @"CellTypeList3";


- (IBAction)more:(UIButton *)button {
    
    RecommendTVC *vc = (RecommendTVC *)[button currentViewController];
    
    
    // 此处暂时写死,因为接口暂无数据判断
    if ([self.groupM.title isEqualToString:@"小编推荐"]) {
        
        RecommendMoreTVC *moreVC = [RecommendMoreTVC new];
        moreVC.navTitle = self.groupM.title;
        [vc.navigationController pushViewController:moreVC animated:YES];
        
    }
    
}



-(void)setGroupM:(GroupModel *)groupM
{
    _groupM = groupM;
    self.titleLabel.text = groupM.title;
    
    [self.collectionView reloadData];
}


-(void)setFrame:(CGRect)frame
{
    frame.size.height -= kCellMargin;
    [super setFrame:frame];
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{

}


-(void)awakeFromNib
{
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    CGFloat width = (kScreenWidth - (kCellCountInRow + 1) * kCellMargin) / kCellCountInRow;
    CGFloat height = width * 1.6;
    self.flowLayout.itemSize = CGSizeMake(width, height);
    self.flowLayout.minimumInteritemSpacing = kCellMargin - 0.1;
    self.flowLayout.minimumLineSpacing = kCellMargin;
    self.collectionView.contentInset = UIEdgeInsetsMake(0, kCellMargin, 0, kCellMargin);

    UINib *nib = [UINib nibWithNibName:@"ItemCell" bundle:[NSBundle bundleForClass:[self class]]];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:itemID];

}

-(void)layoutSubviews
{
    [super layoutSubviews];

}


+ (instancetype)cellWithTableView: (UITableView *)tableView {

    RecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
//        NSArray *frames = [NSBundle allFrameworks];
//        NSBundle *_currentBundle = nil;
//        for (NSBundle *bundle in frames) {
//            NSString *bundleName = bundle.bundleURL.lastPathComponent;
//            if ([bundleName containsString:@"DiscoverModule"]) {
//                _currentBundle = bundle;
//                break;
//            }
//        }
        cell = [[[NSBundle bundleForClass:self] loadNibNamed:@"RecommendCell" owner:nil options:nil] firstObject];
    }
    return cell;

}



#pragma mark - collectionView数据源方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.groupM.list.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    ItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:itemID forIndexPath:indexPath];

    ItemInCellModel *model = self.groupM.list[indexPath.row];
    cell.itemInCellModel = model;

    return cell;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ItemCell *cell = (ItemCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    NSString *priceTypeId = cell.itemInCellModel.priceTypeId;
    
    // 跳转专辑详情页
    if ([priceTypeId isEqualToString:@"0"] || [priceTypeId isEqualToString:@"1"]) {
        
        RecommendTVC *vc = (RecommendTVC *)[cell currentViewController];
        UIViewController *nav = vc.navigationController;
        NSString *albumID = cell.itemInCellModel.albumId;
        kJumpToAlbumDetail(albumID, nav)
    }
}

@end
