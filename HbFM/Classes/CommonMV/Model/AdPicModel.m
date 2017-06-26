//
//  AdPicModel.m
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import "AdPicModel.h"
#import "AdPicProtocol.h"

@interface AdPicModel()<AdPicProtocol>

@end

@implementation AdPicModel

-(void)setFocusImageM:(FocusImageModel *)focusImageM
{
    _focusImageM = focusImageM;
    self.adImgURL = [NSURL URLWithString:_focusImageM.pic];
    
}

-(void)setLiveM:(LiveModel *)liveM {
    _liveM = liveM;
    self.adImgURL = [NSURL URLWithString:_liveM.coverPath];
}

-(void)setTuiguangM:(TuiguangModel *)tuiguangM
{
    _tuiguangM = tuiguangM;
    self.adImgURL = [NSURL URLWithString:_tuiguangM.cover];
}

-(void)setClassItemM:(ClassItemModel *)classItemM
{
    _classItemM = classItemM;
    self.adImgURL = [NSURL URLWithString:_classItemM.coverPath];
}


@end
