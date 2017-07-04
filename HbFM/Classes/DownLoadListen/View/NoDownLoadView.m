

#import "NoDownLoadView.h"

@interface NoDownLoadView()

@property (weak, nonatomic) IBOutlet UIImageView *noDataImageView;


@end

@implementation NoDownLoadView

+ (instancetype)noDownLoadViewWithType: (NoDownLoadViewType)type {


    NSBundle *_currentBundle = [NSBundle bundleForClass:self];

    NoDownLoadView *noDataView = [[_currentBundle loadNibNamed:@"NoDownLoadView" owner:nil options:nil] firstObject];

    NSString *bundleName = [[_currentBundle bundleIdentifier].pathExtension stringByAppendingString:@".bundle"];


    if (type == NoDownLoadViewNoDownLoaded) {
        NSString *downLoadedPath = [_currentBundle pathForResource:@"noData_download.png" ofType:nil inDirectory:bundleName];
        noDataView.noDataImageView.image = [UIImage imageWithContentsOfFile:downLoadedPath];
    }else if(type == NoDownLoadViewNoDownLoading)
    {
        NSString *downLoadedPath = [_currentBundle pathForResource:@"noData_downloading@3x.png" ofType:nil inDirectory:bundleName];
        noDataView.noDataImageView.image = [UIImage imageWithContentsOfFile:downLoadedPath];
        
    }
    return noDataView;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (IBAction)goView {
    if (self.clickBlock != nil) {
        self.clickBlock();
    }
}


@end
