
#import "PanoramaSecantPerspectiveController.h"
#import "kMUDetailViewControllerk.h"
#import <PGDatePicker/PGDatePickManager.h>
#import <AdSupport/AdSupport.h>
#import "LinkTextbookTheatre.h"
@interface PanoramaSecantPerspectiveController ()<UITextFieldDelegate>
@property (nonatomic,strong)LinkTextbookTheatre *serbian;

@property (nonatomic,strong)LinkTextbookTheatre *hTextfile1h;
@property (nonatomic,strong)LinkTextbookTheatre *jTextfile2j;
@property (nonatomic,strong) UIView *fSexSeclectVIewf;

@property (nonatomic,strong) NSString *vNametypev;
@property (nonatomic,strong) NSString *zSextypez;

@property (nonatomic,strong) NSString *terminationTrain;
@property (nonatomic,strong) NSString *oXingStro;
@property (nonatomic,strong) NSString *MingDynastyStylistic;

@property (nonatomic,strong) NSString *dateColleague;

PropertyString(lBazi_idl);

@end

@implementation PanoramaSecantPerspectiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(242, 242, 242);
    self.navigationItem.title = [NSString stringWithFormat:@"%@%@",@"测",@"名"];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageview.image = IMAGE_NAMED(@"xSceBgimagex");
    [self.view addSubview:imageview];
    
    
    
    _vNametypev = @"2";
    _zSextypez = @"2";
    
    [self vCreatDatav];
    [self ditherSpecify];
}

- (void)ditherSpecify{

    
    CGRect frame = CGRectMake(50, 80, KBShieldWidth-100, 40);
    _serbian = [[LinkTextbookTheatre alloc] initWithFrame:frame sWithIcons:[NSString stringWithFormat:@"%@%@%@",@"oXingStro",@".pn",@"g"] kWithPlaceholderTextk:@"姓"];
    _serbian.frame = frame;
    _serbian.zInputTextz.tag =199;
    _serbian.zInputTextz.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _serbian.zInputTextz.autocorrectionType = UITextAutocorrectionTypeNo;
    _serbian.zInputTextz.keyboardType = UIKeyboardTypeDefault;
    _serbian.zInputTextz.delegate = self;
    _serbian.zInputTextz.textColor = KGrayColor;
    UIView *view = [[UIView alloc] initWithFrame:frame];
    [self.view addSubview:view];
    ViewBorderRadius(view, 20, 0.5, KRedColor);
    
    CGRect frame1 = CGRectMake(50, 100+30+20, KBShieldWidth-100, 40);
    _hTextfile1h = [[LinkTextbookTheatre alloc] initWithFrame:frame1 sWithIcons:[NSString stringWithFormat:@"%@%@%@",@"prov",@"idedRf.pn",@"g"] kWithPlaceholderTextk:[NSString stringWithFormat:@"%@%@",@"名",@"字"]];
    _hTextfile1h.frame = frame1;
    _hTextfile1h.zInputTextz.tag =200;
    _hTextfile1h.zInputTextz.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _hTextfile1h.zInputTextz.autocorrectionType = UITextAutocorrectionTypeNo;
    _hTextfile1h.zInputTextz.keyboardType = UIKeyboardTypeDefault;
    _hTextfile1h.zInputTextz.delegate = self;
    _hTextfile1h.zInputTextz.textColor = KGrayColor;
    UIView *view1 = [[UIView alloc] initWithFrame:frame1];
    [self.view addSubview:view1];
    ViewBorderRadius(view1, 20, 0.5, KRedColor);
    
    [self.view addSubview:_serbian];

    [self.view addSubview:_hTextfile1h];
    
    CGRect frame2 = CGRectMake(50, 100+30+20+30+40, KBShieldWidth-100, 40);
    _jTextfile2j = [[LinkTextbookTheatre alloc] initWithFrame:frame2 sWithIcons:[NSString stringWithFormat:@"%@%@%@%@",@"yBirthdayDataStr",@"y",@".pn",@"g"] kWithPlaceholderTextk:[NSString stringWithFormat:@"%@%@",@"出生日",@"期"]];
    _jTextfile2j.frame = frame2;
    _jTextfile2j.zInputTextz.tag =201;
    _jTextfile2j.zInputTextz.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _jTextfile2j.zInputTextz.autocorrectionType = UITextAutocorrectionTypeNo;
    _jTextfile2j.zInputTextz.keyboardType = UIKeyboardTypeDefault;
    _jTextfile2j.zInputTextz.delegate = self;
    _jTextfile2j.zInputTextz.textColor = KGrayColor;
    
    [self.view addSubview:_jTextfile2j];
    
    UIButton *dataBtn = [UIButton buttonWithType:0];
    dataBtn.frame = frame2;
    ViewBorderRadius(dataBtn, 20, 0.5, KRedColor);
    [dataBtn addTarget:self action:@selector(iDataButtonClickedi) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dataBtn];
    
    [self jCreatMoreSexBtnj];
    
    UIButton *makesureBtn = [UIButton buttonWithType:0];
    [self.view addSubview:makesureBtn];
    [makesureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.fSexSeclectVIewf).mas_offset(@(30+40));
        make.left.mas_equalTo(self.view).mas_offset(80);
        make.right.mas_equalTo(self.view).mas_offset(-80);
        make.height.mas_offset(50);
    }];
    ViewRadius(makesureBtn, 25);
    makesureBtn.backgroundColor = KRedColor;
    [makesureBtn setTitle:[NSString stringWithFormat:@"%@%@",@"确",@"定"] forState:0];
    [makesureBtn setTitleColor:KWhiteColor forState:0];
    [makesureBtn addTarget:self action:@selector(dashesEncounteredPenetrate) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)jCreatMoreSexBtnj{
    _fSexSeclectVIewf = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KBShieldWidth, 30)];
    [self.view addSubview:_fSexSeclectVIewf];
    [_fSexSeclectVIewf mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self->_jTextfile2j).mas_offset(@(20+40));
        make.height.mas_offset(@(30));
    }];
    
    NSMutableArray* buttonsArray = [NSMutableArray arrayWithCapacity:3];
    CGFloat margin = KBShieldWidth-160-100;
    CGRect btnRect = CGRectMake(50, 0, 80, 30);
    NSArray *normalIconArr = @[[NSString stringWithFormat:@"%@%@%@",@"mankindPictu",@"r",@"e"],[NSString stringWithFormat:@"%@%@%@%@",@"uWom",@"an",@"I",@"conu"]];
    NSArray *selIconArr = @[[NSString stringWithFormat:@"%@%@%@",@"dManIc",@"on_sel",@"d"],[NSString stringWithFormat:@"%@%@%@%@",@"eW",@"omanIcon_se",@"c",@"e"]];
    NSArray *NameArr = @[[NSString stringWithFormat:@"%@%@",@"男",@"孩"], [NSString stringWithFormat:@"%@%@",@"女",@"孩"]];
    for (int i=0;i<NameArr.count;i++) {
        NSString* optionTitle = NameArr[i];
        tRadioButtont* btn = [[tRadioButtont alloc] initWithFrame:btnRect];
        [btn addTarget:self action:@selector(oOnRadioButtonValueChanged2o:) forControlEvents:UIControlEventValueChanged];
        btnRect.origin.x += (margin+100);
        btn.tag = 200+i;
        [btn setTitle:optionTitle forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [btn setImage:[UIImage imageNamed:normalIconArr[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:selIconArr[i]] forState:UIControlStateSelected];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
        [_fSexSeclectVIewf addSubview:btn];
        [buttonsArray addObject:btn];
    }
    
    [buttonsArray[0] setXGroupButtonsx:buttonsArray]; 
    
    [buttonsArray[0] setSelected:YES]; 
}
- (void) vCreatDatav{
   
    
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
- (void)iDataButtonClickedi{
    [self.hTextfile1h.zInputTextz resignFirstResponder];
    [self.serbian.zInputTextz resignFirstResponder];

    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    PGDatePicker *datePicker = datePickManager.datePicker;
    datePicker.datePickerMode = PGDatePickerModeDateHourMinute;
    datePickManager.confirmButtonTextColor = KRedColor;
    [self presentViewController:datePickManager animated:false completion:nil];
    
    datePicker.selectedDate = ^(NSDateComponents *dateComponents) {
        NSString *month = dateComponents.month<10?[NSString stringWithFormat:@"0%li",(long)dateComponents.month]:kStringFormat(@"%li",(long)dateComponents.month);
        NSString *day = dateComponents.day<10?[NSString stringWithFormat:@"0%li",(long)dateComponents.day]:kStringFormat(@"%li",(long)dateComponents.day);
        NSString *dateColleague = [NSString stringWithFormat:@"%li-%@-%@",(long)dateComponents.year,month,day];
        self->_jTextfile2j.zInputTextz.text = [NSString stringWithFormat:@"%li-%@-%@ %li:%li",(long)dateComponents.year,month,day,(long)dateComponents.hour,(long)dateComponents.minute];
        self.dateColleague = dateColleague;
        self->_jTextfile2j.zInputTextz.backgroundColor = RGB(231, 231, 231);
  
    };
    
}

-(void)dashesEncounteredPenetrate{
    if (self.dateColleague.length==0||self.hTextfile1h.zInputTextz.text.length==0||self.serbian.zInputTextz.text.length==0) {
        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@%@%@%@",@"请完整输",@"入您的",@"信",@"息"]];
    }else{
        _oXingStro = self.serbian.zInputTextz.text;
        _MingDynastyStylistic = self.hTextfile1h.zInputTextz.text;
        [self getMeshingWork];
    }
    
    
}
- (void)getMeshingWork{
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];

    NSDictionary *dic = @{
                        [NSString stringWithFormat:@"%@%@%@%@",@"first_n",@"a",@"m",@"e"]:self->_oXingStro,
                        [NSString stringWithFormat:@"%@%@%@%@%@%@",@"describe",@"T",@"y",@"pewri",@"t",@"e"]:self.vNametypev,
                        [NSString stringWithFormat:@"%@%@",@"se",@"x"]:self.zSextypez,
                        @"birthday":kStringFormat(@"%@ 12:00:00",self.dateColleague),
                        [NSString stringWithFormat:@"%@%@%@",@"ap",@"pnam",@"e"]:[NSString stringWithFormat:@"%@%@%@%@%@%@",@"naming_fug",@"ui_i",@"ph",@"o",@"n",@"e"],
                        [NSString stringWithFormat:@"%@%@",@"cl",@"ient"]:[NSString stringWithFormat:@"%@%@",@"i",@"Phone"],
                        [NSString stringWithFormat:@"%@%@%@",@"dev",@"ic",@"e"]:[NSString stringWithFormat:@"%@%@",@"i",@"Phone"],
                        [NSString stringWithFormat:@"%@%@",@"marke",@"t"]:[NSString stringWithFormat:@"%@%@%@",@"appsto",@"r",@"e"],
                        [NSString stringWithFormat:@"%@%@%@%@",@"o",@"pen",@"ud",@"id"]:[NSString stringWithFormat:@"%@%@%@%@%@%@%@",@"82257E72-44DC-43AD-A",@"6AF-26B",@"F2",@"D",@"F4B6",@"7",@"6"],
                        [NSString stringWithFormat:@"%@%@%@",@"s",@"i",@"gn"]:[NSString stringWithFormat:@"%@%@%@",@"52ece8b5537a9ddbdbc8e3a47",@"8fa64e",@"d"],
                        [NSString stringWithFormat:@"%@%@",@"ve",@"r"]:[NSString stringWithFormat:@"%@%@",@"1.",@"8"],
                        [NSString stringWithFormat:@"%@%@",@"idf",@"a"]:[self getNIDFAn],
                        [NSString stringWithFormat:@"%@%@%@%@",@"u",@"ser_",@"i",@"d"]:@""

                        };
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@",@"get_bazi_",@"i",@"d"];
    [SVProgressHUD show];
    [manager POST:[wBaseUrlw stringByAppendingString:urlStr] parameters:dic headers:@{} progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dateDic = (NSDictionary *)responseObject[@"data"];
            [SVProgressHUD dismiss];
            self.lBazi_idl = dateDic[@"bazi_id"];
            [self workContingentAccountant];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

            [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@%@%@%@%@%@",@"网络请求失",@"败，",@"请稍",@"后",@"重",@"试"]];
        }];
    

}
-(void)workContingentAccountant{
    kMUDetailViewControllerk *nameVC = [[kMUDetailViewControllerk alloc] init];
    nameVC.iInvitei = self.oXingStro ;
    nameVC.plate = self.MingDynastyStylistic;
    nameVC.lBazi_idl= self.lBazi_idl;
    nameVC.hidesBottomBarWhenPushed = YES;

    [self.navigationController pushViewController:nameVC animated:YES];
}
- (void)eOnRadioButtonValueChanged1e:(id)sender{
    UIButton *btn = (UIButton *)sender;
    
    if (btn.tag ==500) {
        _vNametypev = @"1";
    }else{
        _vNametypev = @"2";
    }
}
- (void)oOnRadioButtonValueChanged2o:(id)sender{
    UIButton *btn = (UIButton *)sender;
    if (btn.tag ==400) {
        _zSextypez = @"2";
    }else{
        _zSextypez = @"1";
    }
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.text.length <= 0 && textField.tag ==199) {
        [_serbian textualMatterEndRedact];
    }else if (textField.text.length <= 0 && textField.tag ==200) {
        [_hTextfile1h textualMatterEndRedact];
    }else if (textField.text.length <= 0 && textField.tag ==201){
        [_jTextfile2j fTextEndEditingf];
        
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.text.length <= 0 && textField.tag ==199) {
        [_serbian fTextEndEditingf];
    }else if (textField.text.length <= 0 && textField.tag ==200) {
        [_hTextfile1h fTextEndEditingf];
    }else if (textField.text.length <= 0 && textField.tag ==201){
    }
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.translucent = NO;

}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.translucent = YES;

}
@end
