

#import <UIKit/UIKit.h>
#import "TrackInfoModel.h"
#import "UserInfoModel.h"

@interface PlayerPane : UIView

@property (nonatomic, strong) TrackInfoModel *trackM;
@property (nonatomic, strong) UserInfoModel *userInfoM;


@property (nonatomic, assign) IBInspectable CGFloat radius;

@end
