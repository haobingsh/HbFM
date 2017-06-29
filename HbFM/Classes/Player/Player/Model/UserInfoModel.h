//
//  UserInfoModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject

@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, assign) BOOL isVerified;
@property (nonatomic, copy) NSString *smallLogo;
@property (nonatomic, assign) NSInteger followers;
@property (nonatomic, assign) NSInteger tracks;
@property (nonatomic, assign) NSInteger albums;
@property (nonatomic, copy) NSString *ptitle;
@property (nonatomic, copy) NSString *personDescribe;

@end
