//
//  CommentInfoModel.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "CommentInfoModel.h"
#import "Base.h"

@implementation CommentInfoModel

-(CGFloat)cellHeight {
    
    
    NSDictionary *fontDic = @{
                              NSFontAttributeName: [UIFont systemFontOfSize:10]
                              };
    CGRect fontRect = [self.content boundingRectWithSize:CGSizeMake(kScreenWidth - 73, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDic context:nil];
    
    // 计算高度
    return (fontRect.size.height + 50);
    
    
}

@end
