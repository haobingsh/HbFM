//
//  HomeVC.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeVC : UIViewController

/// 选项卡选中的索引
@property (nonatomic, assign) NSInteger segSelectIndex;
/// segBar的位置
@property (nonatomic, assign) CGRect segBarFrame;

/// 是否让setBar显示更多
@property (nonatomic, assign) BOOL isShowMore;



/// 内容视图的位置大小
@property (nonatomic, assign) CGRect contentScrollViewFrame;

/// 设置选项卡模型和子控制器
- (void)setUpWithSegModels:(NSArray *)segMs andChildVCs:(NSArray *)subVCs;

@end
