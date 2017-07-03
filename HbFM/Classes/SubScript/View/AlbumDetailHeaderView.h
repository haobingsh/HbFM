

#import <UIKit/UIKit.h>
@class Album;

typedef void(^CallBackClickAlbumBlock)(NSInteger tag);
@interface AlbumDetailHeaderView : UIView

@property(nonatomic, strong) Album *album;

/** 传递事件回控制器 **/
@property (nonatomic, copy) CallBackClickAlbumBlock callBackClickAlbum;

@end
