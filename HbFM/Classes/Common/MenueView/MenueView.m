//
//  MenueView.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "MenueView.h"
#import "UpDownBtn.h"

#define kMenueWidth 60
#define kMenueMargin 20

@implementation MenueView

-(void)setMenueModels:(NSArray<id<MenueModelProtocol>> *)menueModels
{
    _menueModels = menueModels;
    
    // 1. 移除所有之前的按钮
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSInteger count = menueModels.count;
    for(int i = 0;i < count; i++)
    {
        id<MenueModelProtocol> model= menueModels[i];
        UpDownBtn *btn = [[UpDownBtn alloc] init];
        if (self.loadBlock) {
            self.loadBlock(btn, [NSURL URLWithString:model.imageURL]);
        }
        [btn setTitle:model.title forState:UIControlStateNormal];
        btn.tag = self.subviews.count;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
        
    }
    
    [self setNeedsLayout];
    
    
}

- (void)btnClick: (UpDownBtn *)upDownBtn {
    
    NSInteger tag = upDownBtn.tag;
    id<MenueModelProtocol> menueModel = self.menueModels[tag];
    if(menueModel.clickBlock != nil)
    {
        menueModel.clickBlock();
    }
    
}



-(void)layoutSubviews {
    [super layoutSubviews];
    
    NSInteger count = self.menueModels.count;
    CGFloat h = self.frame.size.height;
    for(int i = 0; i < count; i++)
    {
        UIView *subView = self.subviews[i];
        subView.frame = CGRectMake(i * (kMenueWidth + kMenueMargin) + kMenueMargin, 0, kMenueWidth, h);
    }
    
    self.contentSize = CGSizeMake((kMenueWidth + kMenueMargin) * count + kMenueMargin, 0);
}


@end
