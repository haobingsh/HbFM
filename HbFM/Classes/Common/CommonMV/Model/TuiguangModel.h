//
//  TuiguangModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TuiguangModel : NSObject

@property (nonatomic, copy)  NSString *shareData;
@property (nonatomic, assign)  BOOL isShareFlag;
@property (nonatomic, copy)  NSString *link;
@property (nonatomic, copy, getter=adImgURL)  NSString *cover;
@property (nonatomic, assign)  NSInteger showstyle;
@property (nonatomic, copy)  NSString *name;
@property (nonatomic, copy)  NSString *Description;
@property (nonatomic, copy)  NSString *scheme;
@property (nonatomic, assign)  NSInteger linkType;
@property (nonatomic, assign)  NSInteger displayType;
@property (nonatomic, assign)  NSInteger clickType;
@property (nonatomic, assign)  NSInteger openlinkType;
@property (nonatomic, assign)  NSInteger loadingShowTime;
@property (nonatomic, copy)  NSString *thirdStatUrl;
@property (nonatomic, copy)  NSString *apkUrl;
@property (nonatomic, copy)  NSString *adtype;
@property (nonatomic, assign)  BOOL Auto;
@property (nonatomic, assign)  NSInteger position;
@property (nonatomic, assign)  NSInteger adid;

@end
