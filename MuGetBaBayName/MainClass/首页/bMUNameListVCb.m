
#import "bMUNameListVCb.h"
#import "nZYCarViewn.h"
#import "eZYCarModele.h"
#import "ShutterCallPose.h"
#import "kMUDetailViewControllerk.h"
static NSString const * RReuseHeaderIDr = @"dNametyped";//mark

typedef void (^WBazixishenwBlock) (float uBlocku);//mark


typedef void (^JItemHeightjBlock) (NSUInteger cViewWidthc);//mark

@protocol JLabel3jExtension <NSObject>
- (void)hWithEventh:(float)fTextfile2f;//mark

@end//mark

#import <AdSupport/AdSupport.h>
@interface bMUNameListVCb ()
PropertyString(atomMongolian);
PropertyString(baziSailing);
PropertyNSArray(NameRegalia);
@property(nonatomic,strong) NSString *nLabel1n;//mark

@property(nonatomic,weak) id<JLabel3jExtension> iTextfilei;//mark

@property(nonatomic,copy) WBazixishenwBlock newsworthinessId;//mark

@end

@implementation bMUNameListVCb
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KWhiteColor;
    self.navigationItem.title = [NSString stringWithFormat:@"%@%@",@"吉",@"名"];
    self.NameRegalia = [NSArray array];
    
    [self hCreatGudingUIh];
    [self tCreatNameListNetWorkingt];

    
}

- (void)tCreatNameListNetWorkingt{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];

    NSLog(@"%@,%@,%@",self.lBazi_idl,self.qFirstnameq,self.describeTypewrite);

    NSDictionary *dic = @{
                        @"first_name":self.qFirstnameq,
                        @"name_type":self.describeTypewrite,
                        @"bazi_id":self.lBazi_idl,
                        @"appname":@"naming_fugui_iphone",
                        @"client":@"iPhone",
                        @"device":@"iPhone",
                        @"market":@"appstore",
                        @"openudid":@"82257E72-44DC-43AD-A6AF-26BF2DF4B676",
                        @"sign":@"52ece8b5537a9ddbdbc8e3a478fa64ed",
                        @"ver":@"1.8",
                        @"idfa":[self getNIDFAn],
                        @"user_id":@""

                        };
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",@"qimi",@"ng"];

    NSString *url =[wBaseUrlw stringByAppendingString:urlStr];
    [SVProgressHUD show];
    [manager POST:url parameters:dic headers:@{} progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [SVProgressHUD dismiss];
            NSDictionary *dateDic = (NSDictionary *)responseObject[@"data"];
            self.NameRegalia = dateDic[@"tjm"];
            [self itemsEscort];
            self.atomMongolian = dateDic[@"info"][@"jianPi"][@"tag"];
            self.baziSailing = dateDic[@"info"][@"jianPi"][@"content"];
            [self ditherSpecify];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

            [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@%@",@"网络请求失败，请稍后重",@"试"]];
        }];
    
    
}
-(NSString *)getNIDFAn
{
    SEL advertisingIdentifierSel = sel_registerName("advertisingIdentifier");
    SEL UUIDStringSel = sel_registerName("UUIDString");

    ASIdentifierManager *manager = [ASIdentifierManager sharedManager];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if([manager respondsToSelector:advertisingIdentifierSel]) {

        id UUID = [manager performSelector:advertisingIdentifierSel];

        if([UUID respondsToSelector:UUIDStringSel]) {

            return [UUID performSelector:UUIDStringSel];

        }

    }
#pragma clang diagnostic pop
    return nil;
}
-(void)itemsEscort{
    NSMutableArray *array = [[NSMutableArray alloc]init];
  
    for (int i = 0; i<self.NameRegalia.count; i++) {
        NSDictionary *nameDic = self.NameRegalia[i];
        eZYCarModele *model = [[eZYCarModele alloc]init];
        model.gImageUrlg = [NSString stringWithFormat:@"50%d",i%9];
        model.tPinyinStrt = nameDic[@"pinYin"];
        model.tNameStrt = nameDic[@"jiMing"];
        model.cWuxingStrc = nameDic[@"wuXing"];
        
        [array addObject:model];
    }
    nZYCarViewn *carView = [[nZYCarViewn alloc]initWithFrame:CGRectMake(0,80 , self.view.frame.size.width, 240)];
    carView.block = ^(NSString *name) {
        [self wJiexiNameWithNamew:name];
    };
    [carView setXArrayDatax:array dSuperScrollViewd:nil];
    [self.view addSubview:carView];
}
-(void)wJiexiNameWithNamew:(NSString *)name{
    
    kMUDetailViewControllerk *namedevc = [[kMUDetailViewControllerk alloc] init];
    namedevc.iInvitei = [name substringToIndex:1];
    namedevc.plate = [name substringFromIndex:1];
    namedevc.lBazi_idl = self.lBazi_idl;
    [self.navigationController pushViewController:namedevc animated:YES];
    
}
-(void)ditherSpecify{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(2, 240+80+20, KBShieldWidth-4, 80)];
    [self.view addSubview:view];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, KBShieldWidth-20, 18)];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat: @"八字精批:【%@】",_atomMongolian]];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(str.length-_atomMongolian.length-1,_atomMongolian.length)];
    label.attributedText = str;
    label.font = SYSTEMFONT(15.0);
    [view addSubview:label];
    
    UILabel *xLabel1x = [[UILabel alloc] initWithFrame:CGRectMake(10, 23, KBShieldWidth-20, 57)];
    xLabel1x.text = _baziSailing;
    xLabel1x.numberOfLines = 0;
    xLabel1x.font = SYSTEMFONT(13.0);
    xLabel1x.textColor =KGray2Color;
    [view addSubview:xLabel1x];
    
    ViewBorderRadius(view, 5, 0.5, RGB(230, 230, 230));
}
-(void)hCreatGudingUIh{
    
    
    UILabel *nLabel2n = [[UILabel alloc] initWithFrame:CGRectMake(10, 240+80+20+80+20, KBShieldWidth-20, 20)];
    nLabel2n.text = [NSString stringWithFormat:@"%@%@%@%@",@"老师温馨提",@"示：如何挑选富贵",@"好名",@"?"];
    nLabel2n.numberOfLines = 0;
    nLabel2n.font = SYSTEMFONT(15.0);

    [self.view addSubview:nLabel2n];
    UILabel *bLabel3b = [[UILabel alloc] initWithFrame:CGRectMake(10, 240+80+20+80+20+20, KBShieldWidth-20, 140)];
    bLabel3b.text = @"1、根据八字看五行含量、日柱旺衰，起名时要补偏救弊。如：喜用木，那么最好能选到五行属木的字体；\n2、扶弱抑强选五格，避开凶数；\n3、根据五格选择笔画组合；\n4、根据笔画查字典看字义。";
    bLabel3b.numberOfLines = 0;
    bLabel3b.font = SYSTEMFONT(15.0);
    bLabel3b.textColor =KGray2Color;
    [self.view addSubview:bLabel3b];
    
}
@end
