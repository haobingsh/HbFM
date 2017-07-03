

#import "DownLoadController.h"
#import "DownLoadCell.h"
#import "SubscribleDataTool.h"
#import "Base.h"

@interface DownLoadController ()
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation DownLoadController

static NSString * const downloadCellId = @"downloadCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
    [self initData];
}

- (void)initView
{
    self.title = @"批量下载";
    self.view.backgroundColor = kCommonColor;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下载中" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonClick)];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DownLoadCell class]) bundle:nil] forCellReuseIdentifier:downloadCellId] ;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)initData
{
    [[SubscribleDataTool shareInstance] getDownLoadListAlbumId:self.albumId position:4 result:^(NSArray<NSString *> *downLoadList, NSError *error) {
        
    }];
}

- (void)rightBarButtonClick
{
    self.tabBarController.selectedIndex = 2;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

// 立即下载
- (IBAction)downloadButtonClick {
    
}

// 全选
- (IBAction)chooseAllButtonClick:(UIButton *)sender {
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DownLoadCell *cell = [tableView dequeueReusableCellWithIdentifier:downloadCellId];
//    cell.recommends = self.recommendList[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}






@end
