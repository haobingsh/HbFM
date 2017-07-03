//
//  AlbumDetailInfo.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "AlbumDetailInfo.h"
#import "UIView+FMLayout.h"
#import "Base.h"

@implementation AlbumDetailInfo

- (CGFloat)contentCellHeight
{
    _contentCellHeight = 37;
    NSDictionary *titleDic = @{
                               NSFontAttributeName: [UIFont systemFontOfSize:13]
                               };
    CGRect titleRect = [self.intro boundingRectWithSize:CGSizeMake(kScreenWidth - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:titleDic context:nil];
    
    _contentCellHeight += (titleRect.size.height + 20);
    
    return _contentCellHeight;
}

@end
