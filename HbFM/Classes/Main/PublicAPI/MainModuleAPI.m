//
//  MainModuleAPI.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "MainModuleAPI.h"
#import "FMTabBar.h"
#import "FMTabBarController.h"
#import "FMNavBar.h"
#import "FMMiddleView.h"

@implementation MainModuleAPI

+ (FMTabBarController *)rootTabBarCcontroller {
    return [FMTabBarController shareInstance];
}


+ (void)addChildVC:(UIViewController *)vc normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController:(BOOL)isRequired {
    
    [[FMTabBarController shareInstance] addChildVC:vc normalImageName:normalImageName selectedImageName:selectedImageName isRequiredNavController:isRequired];
    
}


+ (void)setTabbarMiddleBtnClick: (void(^)(BOOL isPlaying))middleClickBlock {
    
    FMTabBar *tabbar = (FMTabBar *)[FMTabBarController shareInstance].tabBar;
    tabbar.middleClickBlock = middleClickBlock;
    
}

/**
 *  设置全局的导航栏背景图片
 *
 *  @param globalImg 全局导航栏背景图片
 */
+ (void)setNavBarGlobalBackGroundImage: (UIImage *)globalImg {
    [FMNavBar setGlobalBackGroundImage:globalImg];
}
/**
 *  设置全局导航栏标题颜色, 和文字大小
 *
 *  @param globalTextColor 全局导航栏标题颜色
 *  @param fontSize        全局导航栏文字大小
 */
+ (void)setNavBarGlobalTextColor: (UIColor *)globalTextColor andFontSize: (CGFloat)fontSize {
    
    [FMNavBar setGlobalTextColor:globalTextColor andFontSize:fontSize];
    
}

+ (UIView *)middleView {
    return [FMMiddleView middleView];
}


@end
