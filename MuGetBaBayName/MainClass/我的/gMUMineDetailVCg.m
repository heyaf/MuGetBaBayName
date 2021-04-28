
#import "gMUMineDetailVCg.h"
static const NSString * IXingStri = @"hReuseHeaderIDh";//mark

typedef void (^TTextfile1tCallback) (NSString *ySharedLinksy);//mark
@protocol LVisibleCountlProtocol <NSObject>
- (double)mTabBarm;//mark

@end//mark


@interface gMUMineDetailVCg ()

@property(nonatomic,strong) NSString *aHeaderImagea;//mark
@property(nonatomic,weak) id<LVisibleCountlProtocol> streamButtonIndex;//mark

@property(nonatomic,copy) TTextfile1tCallback cMUidc;//mark
@end

@implementation gMUMineDetailVCg
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KWhiteColor;
    self.navigationItem.title = self.Title;
    
    UITextView *serbian = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, KBShieldWidth-20, dKScreenHeightd-20)];
    serbian.userInteractionEnabled = NO;
    
    serbian.text = self.message;
    serbian.font = SYSTEMFONT(15.0);
    [self.view addSubview:serbian];
    
    UIButton *button = [UIButton buttonWithType:0];
    [button setTitle:[NSString stringWithFormat:@"%@%@",@"点击复制客服微",@"信"] forState:0];

    button.titleLabel.font = SYSTEMFONT(13.0);
    [button setTitleColor:KBlackColor forState:0];
    ViewBorderRadius(button, 5, .5, KRedColor);
    [button addTarget:self action:@selector(fButtonClickedf) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    rightItem.imageInsets = UIEdgeInsetsMake(0, 0,0, 0);
    
    if ([self.sHasKefus isEqualToString:@"YES"]) {
        self.navigationItem.rightBarButtonItem = rightItem;
    }
}
- (void)fButtonClickedf{
    [UIPasteboard generalPasteboard].string =[NSString stringWithFormat:@"%@%@%@",@"ccc666888o",@"o",@"o"];
    [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"%@%@",@"客服微信号已复制到粘贴",@"板"]];
}
@end
