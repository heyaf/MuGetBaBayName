
#import "kMUDetailViewControllerk.h"
#import "aCQScrollMenuViewa.h"
#import <AdSupport/AdSupport.h>

@interface kMUDetailViewControllerk ()<rCQScrollMenuViewDelegater,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) aCQScrollMenuViewa *yMenuViewy;
@property (nonatomic,strong) UITableView *tableView;

PropertyString(rPingfenr);
PropertyString(pZiyip);
PropertyString(dBazixishend);
PropertyNSMutableArray(kSancaiMutArrk);
PropertyString(gWugexijieg);

PropertyString(hShengxiaoh);
PropertyString(gShengxiaoYYg);
PropertyString(strictExclusion);

@end

@implementation kMUDetailViewControllerk

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [NSString stringWithFormat:@"%@%@",@"解",@"析"];
    self.view.backgroundColor = KWhiteColor;
    
    self.yMenuViewy = [[aCQScrollMenuViewa alloc]initWithFrame:CGRectMake(0, kTopHeight+10, self.view.width, 30)];
    [self.view addSubview:self.yMenuViewy];
    self.yMenuViewy.fareUnbuttonChatterDelegate = self;
    self.yMenuViewy.sTitleArrays = @[[NSString stringWithFormat:@"%@%@",@"字词释",@"义"],[NSString stringWithFormat:@"%@%@%@%@",@"三",@"才",@"五",@"格"],[NSString stringWithFormat:@"%@%@%@",@"生",@"肖属",@"相"],[NSString stringWithFormat:@"%@%@",@"其他案",@"例"]];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kTopHeight+10+30, self.view.width, dKScreenHeightd - (kTopHeight+10+30+20)) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self tCreatNameListNetWorkingt];
}

- (void)tCreatNameListNetWorkingt{
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];

 
    
    NSDictionary *dic = @{
                        @"first_name":self.iInvitei,
                        @"last_name":self.plate,
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
    NSString *urlStr = @"jieming";
    [SVProgressHUD show];
    [manager POST:[wBaseUrlw stringByAppendingString:urlStr] parameters:dic headers:@{} progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dateDic = (NSDictionary *)responseObject[@"data"];
            [SVProgressHUD dismiss];
            self.nNamemodeln = [ShutterCallPose modelWithDictionary:dateDic[@"name"]];
            self.rPingfenr = dateDic[@"sanCai"][@"JiXiong"];
            NSArray *ziyiArr = dateDic[@"ziyi"];
            self.pZiyip= @"";
            for (int i=0; i<ziyiArr.count; i++) {
                NSDictionary *ziyiDic = ziyiArr[i];
                if (i==0) {
                    self.pZiyip = [self.pZiyip stringByAppendingString:NSStringFormat(@"%@",ziyiDic[@"title"])];
                }else{
                    self.pZiyip = [self.pZiyip stringByAppendingString:kStringFormat(@"\n\n\n%@",ziyiDic[@"title"])];
                }
                
                self.pZiyip = [self.pZiyip stringByAppendingString:NSStringFormat(@"\n %@",ziyiDic[@"content"])];
            }
            self.dBazixishend =  NSStringFormat(@"八字喜用的建议：\n\n%@",dateDic[@"zongGe"][@"bazixishen"]);
            
            NSArray *sancaiArr = dateDic[@"scwgxj"][@"content"];
            self.kSancaiMutArrk = [NSMutableArray arrayWithCapacity:0];
            for (int i=0; i<sancaiArr.count; i++) {
                NSDictionary *sancaiDic = sancaiArr[i];
                NSMutableAttributedString *str= [[NSMutableAttributedString alloc] initWithString:NSStringFormat(@"%@\n%@",sancaiDic[@"title"],sancaiDic[@"detail"])];
                [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,2)];
                
                [self.kSancaiMutArrk addObject:str];
            }
            
            self.gWugexijieg = @"";
            
            self.gWugexijieg = [self.gWugexijieg stringByAppendingString:kStringFormat(@"%@",dateDic[@"wgxj"][@"di"][@"content"])];
            self.gWugexijieg = [self.gWugexijieg stringByAppendingString:kStringFormat(@"\n\n%@",dateDic[@"wgxj"][@"ren"][@"content"])];
            self.gWugexijieg = [self.gWugexijieg stringByAppendingString:kStringFormat(@"\n\n%@",dateDic[@"wgxj"][@"zong"][@"content"])];
            self.gWugexijieg = [self.gWugexijieg stringByAppendingString:kStringFormat(@"\n\n%@",dateDic[@"wgxj"][@"wai"][@"content"])];
            self.gWugexijieg = [self.gWugexijieg stringByAppendingString:kStringFormat(@"\n\n%@\n",dateDic[@"wgxj"][@"tian"][@"content"])];
            
            self.gShengxiaoYYg = dateDic[[NSString stringWithFormat:@"%@%@",@"zod",@"iac"]][[NSString stringWithFormat:@"%@%@%@%@",@"xiY",@"o",@"n",@"g"]];
            self.strictExclusion = dateDic[[NSString stringWithFormat:@"%@%@",@"zod",@"iac"]][[NSString stringWithFormat:@"%@%@%@%@",@"ji",@"Yo",@"n",@"g"]];
            self.hShengxiaoh = dateDic[[NSString stringWithFormat:@"%@%@%@%@",@"ord",@"erI",@"nf",@"o"]][[NSString stringWithFormat:@"%@%@%@",@"s",@"hengXia",@"o"]];
            
            [self.tableView reloadData];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

            [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@%@%@%@",@"网",@"络请求失败，请稍后",@"重",@"试"]];
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

- (void)coilFareHorizon:(aCQScrollMenuViewa *)coilFareHorizon clickedButtonAtIndex:(NSInteger)index{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:index];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *pReuseCellIDp = @"ReuseCellID";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:pReuseCellIDp];
    if (indexPath.section==0&&indexPath.row==0) {
        [cell removeAllSubviews];

        [cell addSubview:[self initialiatoryHeadPosition]];
    }else if(indexPath.row==1&&indexPath.section==0){
        cell.textLabel.text = self.pZiyip;
        cell.textLabel.font = SYSTEMFONT(15.0);
        cell.textLabel.numberOfLines = 0;
    }else if (indexPath.section==0&&indexPath.row==2){
        cell.textLabel.text = self.dBazixishend;;
        cell.textLabel.font = SYSTEMFONT(14.0);
        cell.textLabel.numberOfLines = 0;
    }else if (indexPath.section==3&&indexPath.row==0){
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KBShieldWidth, KBShieldWidth)];
        [cell addSubview:imageV];
        imageV.image = IMAGE_NAMED(@"anli");

    }else if (indexPath.section==1&&indexPath.row==0){
        cell.textLabel.text = [NSString stringWithFormat:@"%@%@",@"三才解析",@"："];
        cell.textLabel.textColor = KRedColor;
        cell.textLabel.font = SYSTEMFONT(16.0);
        cell.textLabel.numberOfLines = 0;
    }else if (indexPath.section==1&&indexPath.row==self.kSancaiMutArrk.count+1){
        cell.textLabel.text = [NSString stringWithFormat:@"%@%@",@"五格解",@"析："];
        cell.textLabel.textColor = KRedColor;
        cell.textLabel.font = SYSTEMFONT(16.0);
        cell.textLabel.numberOfLines = 0;
    }else if (indexPath.section==1&&indexPath.row==self.kSancaiMutArrk.count+2){
        cell.textLabel.text = self.gWugexijieg;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.font = SYSTEMFONT(14.0);
        cell.textLabel.numberOfLines = 0;
    }else if (indexPath.section==1){
        cell.textLabel.attributedText = self.kSancaiMutArrk[indexPath.row-1];
        cell.textLabel.font = SYSTEMFONT(14.0);
        cell.textLabel.numberOfLines = 0;
    }else if (indexPath.section==2&&indexPath.row==1){
        cell.textLabel.text = self.gShengxiaoYYg;
        cell.textLabel.font = SYSTEMFONT(14.0);
        cell.textLabel.numberOfLines = 0;
    }else if (indexPath.section==2&&indexPath.row==3){
        cell.textLabel.text = self.strictExclusion;
        cell.textLabel.font = SYSTEMFONT(14.0);
        cell.textLabel.numberOfLines = 0;
    }else if (indexPath.section==2&&indexPath.row==0){
        cell.textLabel.text = kStringFormat(@"【%@】喜用",self.hShengxiaoh);
        cell.textLabel.textColor = KRedColor;
        cell.textLabel.font = SYSTEMFONT(16.0);
        cell.textLabel.numberOfLines = 0;
    }else if (indexPath.section==2&&indexPath.row==2){
        cell.textLabel.text = kStringFormat(@"【%@】忌用",self.hShengxiaoh);
        cell.textLabel.textColor = KRedColor;
        cell.textLabel.font = SYSTEMFONT(16.0);
        cell.textLabel.numberOfLines = 0;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0&&indexPath.section==0) {
        return 80;
    }else if (indexPath.section==3&&indexPath.row==0){
        return KBShieldWidth;
    }
    return UITableViewAutomaticDimension;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==1) {
        return self.kSancaiMutArrk.count+3;
    }else if (section==2){
        return 4;
    }else if (section==3){
        return 1;
    }
    return 3;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.yMenuViewy.sTitleArrays.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    static NSString *fReuseHeaderIDf = @"ReuseHeaderID";
    UITableViewHeaderFooterView *copingPurview = [tableView dequeueReusableHeaderFooterViewWithIdentifier:fReuseHeaderIDf];
    if (copingPurview == nil) {
        copingPurview = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:fReuseHeaderIDf];
    }
    
    return copingPurview;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    self.yMenuViewy.eCurrentButtonIndexe = section;
}
- (UIView *)initialiatoryHeadPosition{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KBShieldWidth, 80)];
    UILabel *xLabel1x = [[UILabel alloc] initWithFrame:CGRectMake(50, 3, KBShieldWidth-100, 15)];
    xLabel1x.text = self.nNamemodeln.pinYin;
    xLabel1x.textColor = KGrayColor;
    xLabel1x.font = SYSTEMFONT(13.0);
    xLabel1x.textAlignment = NSTextAlignmentCenter;
    [view addSubview:xLabel1x];
    
    UILabel *nLabel2n = [[UILabel alloc] initWithFrame:CGRectMake(50, 30, KBShieldWidth-100, 20)];
    nLabel2n.text = self.nNamemodeln.jiMing;
    nLabel2n.textColor = KBlackColor;
    nLabel2n.font = SYSTEMFONT(16.0);
    nLabel2n.textAlignment = NSTextAlignmentCenter;
    [view addSubview:nLabel2n];
    
    UILabel *bLabel3b = [[UILabel alloc] initWithFrame:CGRectMake(50, 60, KBShieldWidth-100, 15)];
    bLabel3b.text = self.nNamemodeln.wuXing;
    bLabel3b.textColor = KGray2Color;
    bLabel3b.font = SYSTEMFONT(13.0);
    bLabel3b.textAlignment = NSTextAlignmentCenter;
    [view addSubview:bLabel3b];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(25, 15, 50, 20)];
    label4.text = [NSString stringWithFormat:@"%@%@",@"评",@"分"];
    label4.textColor = KGrayColor;
    label4.font = SYSTEMFONT(15.0);
    label4.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label4];
    ViewBorderRadius(label4, 10, 1, KGrayColor);
    
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, 100, 15)];
    label5.text = self.rPingfenr;
    label5.textColor = KRedColor;
    label5.font = SYSTEMFONT(16.0);
    label5.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label5];
    
    ViewBorderRadius(view, 0, 0.3, KGrayColor);
    return view;
}
@end
