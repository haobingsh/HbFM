//
//  FMTabBarController.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "FMTabBarController.h"
#import "FMTabBar.h"
#import "FMNavigationController.h"
#import "UIImage+FMImage.h"
#import "FMMiddleView.h"

@interface FMTabBarController ()

@end

@implementation FMTabBarController

+ (instancetype)shareInstance {
    
    static FMTabBarController *tabbarC;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabbarC = [[FMTabBarController alloc] init];
    });
    return tabbarC;
}

+ (instancetype)tabBarControllerWithAddChildVCsBlock: (void(^)(FMTabBarController *tabBarC))addVCBlock {
    
    FMTabBarController *tabbarVC = [FMTabBarController shareInstance];
    if (addVCBlock) {
        addVCBlock(tabbarVC);
    }
    
    return tabbarVC;
}


-(void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置tabbar
    [self setUpTabbar];
    
}

- (void)setUpTabbar {
    [self setValue:[[FMTabBar alloc] init] forKey:@"tabBar"];
}

/**
 *  根据参数, 创建并添加对应的子控制器
 *
 *  @param vc                需要添加的控制器(会自动包装导航控制器)
 *  @param isRequired             标题
 *  @param normalImageName   一般图片名称
 *  @param selectedImageName 选中图片名称
 */
- (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired {
    
    if (isRequired) {
        FMNavigationController *nav = [[FMNavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage originImageWithName:normalImageName] selectedImage:[UIImage originImageWithName:selectedImageName]];
        
        [self addChildViewController:nav];
    }else {
        [self addChildViewController:vc];
    }
    
}


- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    
    UIViewController *vc = self.childViewControllers[selectedIndex];
    if (vc.view.tag == 666) {
        
        FMMiddleView *middleView = [FMMiddleView middleView];
        middleView.middleClickBlock = [FMMiddleView shareInstance].middleClickBlock;
        middleView.isPlaying = [FMMiddleView shareInstance].isPlaying;
        middleView.middleImg = [FMMiddleView shareInstance].middleImg;
        CGRect frame = middleView.frame;
        frame.size.width = 65;
        frame.size.height = 65;
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        frame.origin.x = (screenSize.width - 65) * 0.5;
        frame.origin.y = screenSize.height - 65;
        middleView.frame = frame;
        [vc.view addSubview:middleView];
        
    }
    
    
}

@end
