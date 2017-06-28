//
//  AdPicView.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdPicProtocol.h"

typedef void(^LoadImageBlock)(UIImageView *imageView, NSURL *url);

@protocol AdPicViewDelegate <NSObject>

- (void)adPicViewDidSelectedPicModel: (id <AdPicProtocol>)picM;

@end

@interface AdPicView : UIView

+ (instancetype)picViewWithLoadImageBlock: (LoadImageBlock)loadBlock;
/**
 *  用于加载图片的代码块, 必须赋值
 */
@property (nonatomic, copy) LoadImageBlock loadBlock;

/**
 *  用于告知外界, 当前滚动到的是哪个广告数据模型
 */
@property (nonatomic, strong) id<AdPicViewDelegate> delegate;

/**
 *  用来展示图片的数据源
 */
@property (nonatomic, strong) NSArray <id <AdPicProtocol>>*picModels;


@end
