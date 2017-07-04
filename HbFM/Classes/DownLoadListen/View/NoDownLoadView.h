

#import <UIKit/UIKit.h>

typedef enum {
    NoDownLoadViewNoDownLoaded,
    NoDownLoadViewNoDownLoading
}NoDownLoadViewType;

@interface NoDownLoadView : UIView

+ (instancetype)noDownLoadViewWithType: (NoDownLoadViewType)type;

@property (nonatomic, copy) void(^clickBlock)();

@end
