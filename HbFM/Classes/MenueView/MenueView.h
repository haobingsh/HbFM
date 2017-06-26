//
//  MenueView.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenueModelProtocol.h"

typedef void(^XMGMenueViewLoadImageBlock)(UIButton *imageBtn, NSURL *url);

@interface MenueView : UIScrollView

@property (nonatomic, copy) XMGMenueViewLoadImageBlock loadBlock;


@property (nonatomic, strong) NSArray <id<MenueModelProtocol>>*menueModels;


@end
