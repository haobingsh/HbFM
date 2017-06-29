//
//  PlayerSetModelToCell.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "PlayerSetModelToCell.h"
#import "TrackInfoModel.h"
#import "TrackInfoListCell.h"

@implementation PlayerSetModelToCell

+ (void)setModel:(id)model toCell:(UITableViewCell *)cell {
    
    
    if ([model isKindOfClass:[TrackInfoModel class]]) {
        TrackInfoModel *modelR = (TrackInfoModel *)model;
        if ([cell isKindOfClass:[TrackInfoListCell class]]) {
            
            TrackInfoListCell *cellR = (TrackInfoListCell *)cell;
            
            cellR.trackTitleLabel.text = modelR.title;
            
            // 判断, 是否存在下载文件
            //            NSArray *downLoadMIDs = [[XMGDownLoadDataTool getCurrentDownLoadedVoiceMs] valueForKeyPath:@"id"];
            NSArray *downLoadMIDs;
            if ([downLoadMIDs containsObject:@(modelR.trackId)]) {
                [cellR.downLoadBtn setImage:[UIImage imageNamed:@"cell_downloaded"] forState:UIControlStateNormal];
            }else {
                [cellR.downLoadBtn setImage:[UIImage imageNamed:@"cell_download"] forState:UIControlStateNormal];
            }
            
            
            
            
        }
        
    }
    
}


@end
