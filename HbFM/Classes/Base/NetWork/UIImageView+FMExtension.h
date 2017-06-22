//
//  UIImageView+FMExtension.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (FMExtension)

- (void)setURLImageWithURL: (NSURL *)url progress:(void(^)(CGFloat progress))progress complete: (void(^)())complete;

- (void)setURLImageWithURL: (NSURL *)url placeHoldImage:(UIImage *)placeHoldImage isCircle:(BOOL)isCircle;

@end
