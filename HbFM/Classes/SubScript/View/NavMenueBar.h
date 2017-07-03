//
//  NavMenueBar.h
//  HbFM
//
//  Created by 郝兵 on 2017/7/3.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavMenueBarDelegate <NSObject>
/** 点击选中 **/
- (void)navMenueBarDidSelectIndex:(NSInteger)selectedIndex fromIndex: (NSInteger)fromIndex;

@end

@interface NavMenueBar : UIScrollView

@property (nonatomic, weak) id<NavMenueBarDelegate> menueBarDelegate;
@property (nonatomic, strong) NSArray <NSString *>*items;
@property (nonatomic, assign) NSInteger selectedIndex;

@end
