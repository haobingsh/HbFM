//
//  AnchorInfo.m
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "AnchorInfo.h"
#import "Base.h"

@implementation AnchorInfo

- (CGFloat)anchorCellHeight
{
    NSDictionary *titleDic = @{
                               NSFontAttributeName: [UIFont systemFontOfSize:14]
                               };
    CGRect titleRect = [self.personalSignature boundingRectWithSize:CGSizeMake(kScreenWidth - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:titleDic context:nil];
    
    _anchorCellHeight = titleRect.size.height + 122;
    return _anchorCellHeight;
}

@end
