//
//  ClassCellBtn.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "ClassCellBtn.h"
#import "UIView+FMLayout.h"

@implementation ClassCellBtn

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    return CGRectMake(self.width * 0.2, self.centerY / 2, 25, 25);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(self.width * 0.4, 0, self.width, self.height);
}


@end
