//
//  UpDownBtnPlayer.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/29.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "UpDownBtnPlayer.h"

@interface UpDownBtnPlayer()

@property (nonatomic, assign) CGFloat radio;

@end


@implementation UpDownBtnPlayer

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return self;
}


-(void)awakeFromNib {
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    //    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    self.titleLabel.font = [UIFont systemFontOfSize:12];
}

-(CGFloat)radio {
    return 0.7;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    return CGRectMake(0, contentRect.size.height * self.radio, contentRect.size.width, contentRect.size.height * (1 - self.radio));
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height * self.radio);
    
}



@end
