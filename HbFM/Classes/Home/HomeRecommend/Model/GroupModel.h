//
//  GroupModel.h
//  HbFM
//
//  Created by 郝兵 on 2017/6/26.
//  Copyright © 2017年 郝兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LiveModel;
@class TuiguangModel;
#import "ItemInCellModel.h"
#import "SpecialColumnModel.h"

typedef enum{
    
    CellTypeList3,
    CellTypeList2,
    CellTypeList1
    
    
}CellType;


@interface GroupModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL hasMore;


@property (nonatomic, strong) NSArray *list;
@property (nonatomic, strong) NSArray <LiveModel *>*liveMs;
@property (nonatomic, strong) NSArray <TuiguangModel *>*tuiguangMs;
//@property (nonatomic, strong) NSArray <XMGRadioModel *>* radioMs;

@property (nonatomic, assign) CellType cellType;
@property (nonatomic, assign) NSInteger sortID;

@end
