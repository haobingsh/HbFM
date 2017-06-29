//
//  XMGPlayListSheetView.h
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/18.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackInfoModel.h"

@interface PlayListSheetView : UIView

- (void)setAlbumID:(NSInteger)albumID trackID:(NSInteger)trackId;

@property (nonatomic, strong) void(^closeBlock)();

@property (nonatomic, strong) void(^clickItemBlock)(TrackInfoModel *trackM);

@property (nonatomic, strong) NSMutableArray <TrackInfoModel *>*trackInfoMs;
@property (nonatomic, assign) NSInteger currentIndex;
@end
