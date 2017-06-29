

#import <UIKit/UIKit.h>
#import "DanmuProtocol.h"



typedef void(^LoadImageBlock)(UIImageView *imageView, NSURL *url);

@interface DanmuView : UIView

+ (instancetype)danmuViewWithDanmuM:(id<DanmuProtocol>)danmuM;

@property (nonatomic, strong) id<DanmuProtocol> danmuM;

/**
 *  用于加载图片的代码块, 必须赋值
 */
@property (nonatomic, copy) LoadImageBlock loadBlock;

// 在某个位置显示星星
- (void)showStars:(CGPoint)point;


@end
