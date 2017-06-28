//
//  RecommendMoreTVC.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "RecommendMoreTVC.h"
#import "RecommendDataTool.h"
#import "NominateEditorCell.h"
#import "HomeRecommendDefine.h"

@interface RecommendMoreTVC ()
@property (nonatomic, strong)NSArray <NominateEditorModel *> *editorMs;
@end

@implementation RecommendMoreTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.navTitle;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 88.0;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"NominateEditorCell" bundle:[NSBundle bundleForClass:[self class]]] forCellReuseIdentifier:@"NominateEditorCell"];
    
    [[RecommendDataTool shareInstance] getRecommendEditorList:^(NSArray <NominateEditorModel *> *editorMs, NSError *error) {
        
        self.editorMs = editorMs;
        
        [self.tableView reloadData];
        
    }];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.editorMs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NominateEditorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NominateEditorCell"];
    
    NominateEditorModel *model = self.editorMs[indexPath.row];
    cell.model = model;
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //albumId
    NominateEditorModel *model = self.editorMs[indexPath.row];
    NSString *albumID = [NSString stringWithFormat:@"%zd", model.albumId];
    UINavigationController *nav = self.navigationController;
    kJumpToAlbumDetail(albumID, nav)
    
}

@end
