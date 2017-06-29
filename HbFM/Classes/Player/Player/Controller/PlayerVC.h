//
//  PlayerVC.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerVC : UITableViewController

+ (UINavigationController *)shareInstanceWithAlbumId: (NSInteger)albumId trackUid:(NSInteger)trackUid isUseCache: (BOOL)isUseCache;

/** 加载网络音频 */
// 此字段可以为0
@property (nonatomic, assign)  NSInteger albumId;
// 必传字段
@property (nonatomic, assign)  NSInteger trackUid;

- (void)loadData;


@end
