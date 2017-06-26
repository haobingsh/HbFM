//
//  SpecialColumnModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialColumnModel : NSObject

@property (nonatomic, assign)  NSInteger columnType;
@property (nonatomic, assign)  NSInteger specialId;
@property (nonatomic, copy)  NSString *title;
@property (nonatomic, copy)  NSString *subtitle;
@property (nonatomic, copy)  NSString *footnote;
@property (nonatomic, copy)  NSString *coverPath;
@property (nonatomic, copy)  NSString *contentType;

@end
