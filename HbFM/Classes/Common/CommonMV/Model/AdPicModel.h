//
//  AdPicModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FocusImageModel.h"
#import "LiveModel.h"
#import "TuiguangModel.h"
#import "ClassItemModel.h"

@interface AdPicModel : NSObject

@property (nonatomic, strong) FocusImageModel *focusImageM;

@property (nonatomic, strong) LiveModel *liveM;

@property (nonatomic, strong) TuiguangModel *tuiguangM;

@property (nonatomic, strong) ClassItemModel *classItemM;



/**
 *  广告图片URL
 */
@property (nonatomic, copy) NSURL *adImgURL;

/**
 *  点击广告, 需要跳转的URL
 */
@property (nonatomic, copy) NSURL *adLinkURL;

/**
 *  点击执行的代码块(优先级高于adLinkURL)
 */
@property (nonatomic, copy) void(^clickBlock)();

@end
