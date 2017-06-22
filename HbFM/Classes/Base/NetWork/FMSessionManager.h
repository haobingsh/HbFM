//
//  FMSessionManager.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    RequestTypeGet,
    RequestTypePost
    
}RequestType;

@interface FMSessionManager : NSObject

- (void)setValue:(NSString *)value forHttpField:(NSString *)field;

- (void)request:(RequestType)requestType urlStr: (NSString *)urlStr parameter: (NSDictionary *)param resultBlock: (void(^)(id responseObject, NSError *error))resultBlock;

@end
