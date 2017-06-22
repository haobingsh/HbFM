//
//  UIImageView+FMExtension.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/22.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "UIImageView+FMExtension.h"
#import "UIImageView+WebCache.h"
#import "UIImage+FMImage.h"

@implementation UIImageView (FMExtension)

- (void)setURLImageWithURL: (NSURL *)url progress:(void(^)(CGFloat progress))progress complete: (void(^)())complete {
    
    [self sd_setImageWithURL:url placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize,NSURL *imageURL) {
        if (progress != nil)
        {
            progress(1.0 * receivedSize / expectedSize);
        }
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = image;
        if (complete != nil)
        {
            complete();
        }
    }];
    
}

- (void)setURLImageWithURL: (NSURL *)url placeHoldImage:(UIImage *)placeHoldImage isCircle:(BOOL)isCircle {
    
    if (isCircle) {
        [self sd_setImageWithURL:url placeholderImage:[placeHoldImage circleImage] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            UIImage *resultImage = [image circleImage];
            
            // 6. 处理结果图片
            if (resultImage == nil) return;
            self.image = resultImage;
            
            
        }];
        
    }else {
        [self sd_setImageWithURL:url placeholderImage:placeHoldImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            // 6. 处理结果图片
            if (image == nil) return;
            self.image = image;
            
            
        }];
        
    }
    
    
}


@end
