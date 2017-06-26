//
//  ClassificationDataTool.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MenueModel;
@class AdPicModel;
@class ClassItemModel;

@interface ClassificationDataTool : NSObject

+ (instancetype)shareInstance;

/**
 *  获取分类模块的 "图文菜单"
 *
 *  @param result 图文菜单列表
 */
- (void)getPicMenueList:(void(^)(NSArray <MenueModel *>*menuePicMs, NSError *error))result;


/**
 *  获取分类模块的  "广告列表"
 *
 *  @param result 广告列表
 */
- (void)getAdList:(void(^)(NSArray <AdPicModel *>*adMs, NSError *error))result;

/**
 *  获取分类模块的  "选项列表"
 *
 *  @param result 选项列表
 */
- (void)getClassItemList:(void(^)(NSArray *classItemMs, NSError *error))result;


@end
