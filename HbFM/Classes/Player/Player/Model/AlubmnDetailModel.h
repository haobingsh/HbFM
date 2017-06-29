//
//  AlubmnDetailModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlubmnDetailModel : NSObject

@property (nonatomic, assign) NSInteger ret;
@property (nonatomic, assign) NSInteger trackId;
@property (nonatomic, copy) NSString *lyric;
@property (nonatomic, copy) NSString *richIntro;
@property (nonatomic, copy) NSString *images;
@property (nonatomic, copy) NSString *msg;

@end
