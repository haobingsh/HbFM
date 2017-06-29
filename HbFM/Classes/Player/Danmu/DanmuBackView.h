//
//  DanmuBackView.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DanmuProtocol.h"

#define kDanmuStateChangeNotification @"danmuStateChange"

@protocol DanmuBackViewRequiredProtocol <NSObject>

/** 当前时间, 内部会每隔一秒读取一次这个数值, 来决定弹幕的展示 */
@property (nonatomic, assign, readonly) NSTimeInterval currentTime;

/** 根据弹幕模型 获取弹幕视图来展示 */
- (UIView *)danmuViewWithDanmuM: (id<DanmuProtocol>)danmuM;;

/** 点击了某个弹幕,需要做的事情 */
- (void)danmuViewDidClick: (UIView *)danmuView pointInBackView: (CGPoint)point;

@end

@interface DanmuBackView : UIView

@property (nonatomic, strong) id<DanmuBackViewRequiredProtocol> requireDelegate;

@property (nonatomic, strong) NSMutableArray <id<DanmuProtocol>>*danmuMs;

- (void)clear;
- (void)pause;
- (void)resume;


@end
