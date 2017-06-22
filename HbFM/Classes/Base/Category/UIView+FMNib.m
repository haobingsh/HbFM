//
//  UIView+FMNib.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "UIView+FMNib.h"
#import "NSObject+FMBundle.h"

@implementation UIView (FMNib)

+ (instancetype)loadFromNib {
    
    UIView *view = [[self currentBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
    return view;
    
}

- (UIViewController *)currentViewController
{
    
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
