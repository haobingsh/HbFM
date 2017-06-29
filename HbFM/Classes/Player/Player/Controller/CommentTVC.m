//
//  CommentTVC.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "CommentTVC.h"
#import "CommentInfoModel.h"
#import "CommentCell.h"
#import "PlayerDataTool.h"
#import "Base.h"

@interface CommentTVC ()

@property (nonatomic, strong) NSArray <CommentInfoModel *>*commentInfoMs;

@end

@implementation CommentTVC

-(void)setCommentInfoMs:(NSArray<CommentInfoModel *> *)commentInfoMs
{
    _commentInfoMs = commentInfoMs;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"所有评论";
    
    kWeakSelf
    
    [[PlayerDataTool shareInstance] getCommentMsWithTrackId:self.trackId retuslt:^(NSArray<CommentInfoModel *> *commentMs) {
        weakSelf.commentInfoMs = commentMs;
    }];
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.commentInfoMs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CommentCell *cell = [CommentCell cellWithTableView:tableView];
    
    CommentInfoModel *commentM = self.commentInfoMs[indexPath.row];
    
    cell.commentInfoM = commentM;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentInfoModel *commentM = self.commentInfoMs[indexPath.row];
    return commentM.cellHeight;
}

@end
