

#import "DownLoadAlbumCell.h"


@implementation DownLoadAlbumCell

static NSString *const cellID = @"downLoadAlbum";

+ (instancetype)cellWithTableView:(UITableView *)tableView {

    DownLoadAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    if (cell == nil) {
            cell = [[[NSBundle bundleForClass:self] loadNibNamed:@"DownLoadAlbumCell" owner:nil options:nil] firstObject];

    }

    return cell;
}

- (IBAction)delete {

    if (self.deleteBlock) {
        self.deleteBlock();
    }

}



@end
