

#import <UIKit/UIKit.h>
@class Recommends;
@class OtherRecommand;

@interface RecommendsCell : UITableViewCell

@property(nonatomic, strong) Recommends *recommends;
@property(nonatomic, strong) OtherRecommand *otherRecommand;

@end
