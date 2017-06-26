//
//  MenueModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenueModel : NSObject

@property (nonatomic, copy) NSString *contentType;
@property (nonatomic, copy, getter=imageURL) NSString *coverPath;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) void(^clickBlock)();

@end
