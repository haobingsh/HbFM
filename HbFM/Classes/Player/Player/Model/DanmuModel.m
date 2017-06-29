//
//  DanmuModel.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "DanmuModel.h"
#import "DanmuProtocol.h"

@implementation DanmuModel

- (NSAttributedString *)attributeContent {
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] init];
    
    NSAttributedString *userName = [[NSAttributedString alloc] initWithString:[self.nickname stringByAppendingString:@": "] attributes:@{
                                                                                                                                         NSFontAttributeName: [UIFont systemFontOfSize:12],
                                                                                                                                         NSForegroundColorAttributeName: [UIColor brownColor]
                                                                                                                                         }];
    [attributeStr appendAttributedString:userName];
    
    NSAttributedString *content = [[NSAttributedString alloc] initWithString:self.content attributes:@{
                                                                                                       NSFontAttributeName: [UIFont systemFontOfSize:12],
                                                                                                       NSForegroundColorAttributeName: [UIColor grayColor]
                                                                                                       }];
    [attributeStr appendAttributedString:content];
    
    return attributeStr;
}

-(NSTimeInterval)liveTime {
    NSInteger time = self.content.length + self.nickname.length;
    return time > 20 ? 20 : time;
}

@end
