//
//  FMSessionManager.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "FMSessionManager.h"
#import <AFNetworking.h>

@interface FMSessionManager()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation FMSessionManager

- (void)setValue:(NSString *)value forHttpField:(NSString *)field {
    [self.sessionManager.requestSerializer setValue:value forHTTPHeaderField:field];
}

-(AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [[AFHTTPSessionManager alloc] init];
        NSMutableSet *setM = [_sessionManager.responseSerializer.acceptableContentTypes mutableCopy];
        [setM addObject:@"text/plain"];
        [setM addObject:@"text/html"];
        _sessionManager.responseSerializer.acceptableContentTypes = [setM copy];
    }
    return _sessionManager;
}

- (void)request:(RequestType)requestType urlStr: (NSString *)urlStr parameter: (NSDictionary *)param resultBlock: (void(^)(id responseObject, NSError *error))resultBlock {
    
    
    void(^successBlock)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultBlock(responseObject, nil);
    };
    
    void(^failBlock)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        resultBlock(nil, error);
    };
    
    if (requestType == RequestTypeGet) {
        [self.sessionManager GET:urlStr parameters:param progress:nil success:successBlock failure:failBlock];
    }else {
        [self.sessionManager POST:urlStr parameters:param progress:nil success:successBlock failure:failBlock];
    }
    
    
}


@end
