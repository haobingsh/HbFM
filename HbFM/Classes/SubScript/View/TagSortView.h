

#import <UIKit/UIKit.h>
@protocol TagSortViewDelegate<NSObject>
- (void)tagSortDidClickButton:(NSString *)title;
@end

@interface TagSortView : UIView
@property (nonatomic, weak) id<TagSortViewDelegate> delegate;
@end
