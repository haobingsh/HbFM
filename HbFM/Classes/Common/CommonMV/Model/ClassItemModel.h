//
//  ClassItemModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassItemModel : NSObject

@property (nonatomic, copy)  NSString *id;
@property (nonatomic, copy)  NSString *name;
@property (nonatomic, copy)  NSString *title;
@property (nonatomic, assign)  BOOL isChecked;
@property (nonatomic, assign)  NSInteger orderNum;
@property (nonatomic, copy)  NSString *coverPath;
@property (nonatomic, assign)  BOOL selectedSwitch;
@property (nonatomic, assign)  BOOL isFinished;
@property (nonatomic, copy)  NSString *contentType;
@property (nonatomic, assign)  NSInteger categoryType;
@property (nonatomic, assign)  BOOL filterSupported;
@property (nonatomic, assign)  BOOL isPaid;

@end
