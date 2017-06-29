//
//  XMGPlayerGroupCell.h
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/17.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerGroupModel.h"
#import "PlayerCommentGroupModel.h"

@interface PlayerGroupCell : UITableViewCell

@property (nonatomic, strong) PlayerGroupModel *associationAlbumGroupM;

@property (nonatomic, strong) PlayerCommentGroupModel *commentGroupM;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
