//
//  ShareModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/7/4.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareModel : NSObject

@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) NSInteger lengthLimit;
@property (nonatomic, copy) NSString *picUrl;
@property (nonatomic, copy) NSString *rowKey;
@property (nonatomic, copy) NSString *shareType;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *weixinPic;

@end
