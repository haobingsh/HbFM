//
//  HistoryController.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "HistoryController.h"
#import "HistoryCell.h"
#import "HistoryHeaderView.h"

#define SCREENHEIGHT  [UIScreen mainScreen].bounds.size.height
#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
@interface HistoryController ()<HistoryHeaderViewDelegate>

@end

@implementation HistoryController

static NSString * const historyCellId = @"historyCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView
{
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HistoryCell class]) bundle:[NSBundle bundleForClass:[self class]]] forCellReuseIdentifier:historyCellId];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    HistoryHeaderView *headerView = [[NSBundle bundleForClass:[self class]] loadNibNamed:@"XMGHistoryHeaderView" owner:nil options:nil].firstObject;
    headerView.delegate = self;
    headerView.frame = CGRectMake(0, 10, SCREENWIDTH, 44);
    self.tableView.tableHeaderView = headerView;
}

#pragma mark - XMGHistoryHeaderViewDelegate
- (void)historyHeaderViewDidClickHeaderButton:(NSString *)title
{
    if ([title isEqualToString:@"选择删除"]) {
        
        [self.tableView setEditing:!self.tableView.isEditing animated:YES];
        
    }else
    {
        NSLog(@"一键清空");
    }
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:historyCellId];
    //    cell.showsReorderControl = YES;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView
          editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [dataArray removeObjectAtIndex:indexPath.row];

//        [testTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];

//    }
//}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

//指定该行能够移动
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//        return YES;
//}

//移动方法
//- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
//{
//
//}

@end
