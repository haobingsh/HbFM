

#import "TrackInfoListCell.h"

@implementation TrackInfoListCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {

    TrackInfoListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"trackInfo"];
    if (cell == nil) {

        cell = [[NSBundle bundleForClass:self] loadNibNamed:@"TrackInfoListCell" owner:nil options:nil].firstObject;

    }
    return cell;
}



- (IBAction)downLoad {


    if (self.downLoadBlock) {
        self.downLoadBlock();
    }

}




@end
