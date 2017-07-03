

#import "AlbumDetailContentCell.h"
#import "AlbumDetailInfo.h"
@interface AlbumDetailContentCell()

@property (weak, nonatomic) IBOutlet UILabel *introLabel;

@end

@implementation AlbumDetailContentCell

- (void)setAlbumDetailInfo:(AlbumDetailInfo *)albumDetailInfo{
    _albumDetailInfo = albumDetailInfo;
    self.introLabel.text = albumDetailInfo.intro;
}

@end
