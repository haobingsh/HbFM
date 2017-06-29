//
//  MenueBarShowDetailCVC.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NSString+SegmentModelProtocol.h"

@interface MenueBarShowDetailCVC : UICollectionViewController

@property (nonatomic, assign) CGFloat expectedHeight;

@property (nonatomic, strong) NSArray <id<SegmentModelProtocol>>*items;

@end
