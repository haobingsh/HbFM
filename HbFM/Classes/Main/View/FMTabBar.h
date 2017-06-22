//
//  FMTabBar.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FMMiddleView;
@interface FMTabBar : UITabBar

@property (nonatomic, weak) FMMiddleView *middleView;

/**
 点击中间按钮的执行代码块
 */
@property (nonatomic, copy) void(^middleClickBlock)(BOOL isPlaying);


@end
